require 'csv'
require 'pry'

class EventReporter
  attr_reader :printer, :command, :menu, :args, :repo, :queue

  def initialize
    @printer = Printer.new
    @menu    = Menu.new
    @command = ''
    @args    = ''
    @queue   = Queue.new
    @repo    = AttendeeRepo.new
  end

  def run
    printer.intro
    @command, *@args = get_input.split
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
      printer.display_commands
    end
  end

  def queue_sub_menu(args)
    arg = args[0..1].join(' ')
    case
    when count?(arg)
      printer.display_queue_count(queue.count)
    when clear?(arg)
      return printer.fail_message('clear') if queue.attendees.empty?
      queue.clear
      printer.successfully_cleared(queue.count)
    when print?(arg)
      print_menu
    when print_by?(arg)
      results = queue.print_by_attribute(args[2])
      printer.print_by(results)
    when save_to?(arg)
      return printer.fail_message('save') if queue.attendees.empty?

      # queue.save_to(filename)
      printer.display_save_info(command[3])
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

  def quit?
    command == 'quit'
  end

  def load_menu(args)
    if args.empty?
      filepath = 'data/event_attendees' + '.csv'
    else
      filepath = args.flatten + '.csv'
    end
    @repo = AttendeeRepo.new(filepath)
  end

  def find_menu(args)
    return "\nIncomplete Query - 'find <attribute> <criteria>'\n" if args.count < 2
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
    end
  end

  def print_menu
    return printer.display_queue(queue.attendees) if command[2] != 'by'

    #repo.find_by(command[4])
    puts "sorting something to print here..."
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
