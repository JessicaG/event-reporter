require 'csv'

class EventReporter
  attr_reader :printer, :command, :args, :repo, :queue

  def initialize
    @printer = Printer.new
    @command = ''
    @args    = ''
    @queue   = AttendeeQueue.new
  end

  def run
    printer.intro
    @command, *@args = get_input.split
    load_menu([])
    until quit?
      command_menu
      @command, *@args = get_input.split
    end
    printer.outro
  end

  private
  def get_input
    printer.prompt
    gets.strip.downcase
  end

  def command_menu
    case command
    when 'find'  then find_menu(args)
    when 'load'  then load_menu(args)
    when 'queue' then queue_sub_menu(args)
    when 'help'  then help_menu
    when 'menu'  then printer.display_commands
    when 'quit'  then printer.goodbye
    else
      input_error
    end
  end

  def help_menu
    arg = args.join
    case
    when count?(arg)      then printer.description_count
    when clear?(arg)      then printer.description_clear
    when print?(arg)      then printer.description_print
    when save_to?(arg)    then printer.description_save_to
    when find?(arg)       then printer.description_find
    when load?(arg)       then printer.description_load
    when queue?(arg)      then printer.description_queue
    else
      printer.help_commands
    end
  end

  def queue_sub_menu(args)
    arg = args[0..1].join(' ')
    case
    when count?(arg)
      return printer.no_results if queue.empty?
      printer.display_queue_count(queue.count)
    when clear?(arg)
      return printer.fail_message('clear') if queue.attendees.empty?
      queue.clear
      printer.successfully_cleared(queue.count)
    when print?(arg)
      return printer.no_results if queue.empty?
      printer.display_queue(queue.attendees)
    when print_by?(arg)
      return printer.no_results if queue.empty?
      results = queue.print_by_attribute(args[2])
      printer.print_by(results)
    when save_to?(arg)
      return printer.fail_message('save') if queue.attendees.empty?
      printer.display_save_info(filename)
    else
      input_error
    end
  end

  def display(method, data)
    printer.send(method, data)
  end

  def input_error
    printer.incorrect_entry
    printer.display_commands
  end

  def load_menu(args)
    if args.empty?
      filepath = 'data/event_attendees.csv'
    else
      filepath = args.join + '.csv'
    end
    @repo = AttendeeRepo.new(filepath)
    printer.file_loaded(filepath)
  end

  def find_menu(args)
    return printer.incomplete_query if args.count < 2
    attribute = args[0]
    criteria  = args[1]

    case attribute
    when 'first_name' then queue.attendees = repo.find_by_first_name(criteria)
    when 'last_name'  then queue.attendees = repo.find_by_last_name(criteria)
    when 'email'      then queue.attendees = repo.find_by_email(criteria)
    when 'phone'      then queue.attendees = repo.find_by_phone(criteria)
    when 'street'     then queue.attendees = repo.find_by_street(criteria)
    when 'city'       then queue.attendees = repo.find_by_city(criteria)
    when 'state'      then queue.attendees = repo.find_by_state(criteria)
    when 'zipcode'    then queue.attendees = repo.find_by_zipcode(criteria)
    else
      printer.incomplete_query
    end
  end

  def quit?
    command == 'quit'
  end

  def load?(arg)
    arg == 'load'
  end

  def find?(arg)
    arg == 'find'
  end

  def queue?(arg)
    arg == 'queue'
  end

  def help?(arg)
    arg == 'help'
  end

  def count?(arg)
    arg == 'count'
  end

  def clear?(arg)
    arg == 'clear'
  end

  def print?(arg)
    arg == 'print'
  end

  def print_by?(arg)
    arg == 'print by'
  end

  def save_to?(arg)
    arg == 'save' && arg == 'to'
  end
end
