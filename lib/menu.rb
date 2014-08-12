class Menu
  attr_reader :repo, :queue

  def initialize
    @repo  = AttendeeRepo.new
    @queue = Queue.new
  end

  def load_menu(filepath)
    @repo = AttendeeRepo.new(filepath)
    #printer.file_loaded(args[0]) if success message true
  end

  def find_menu(args)
    return "\nIncomplete Query - 'find <attribute> <criteria>'\n" if args.count < 2
    attribute = args[0]
    criteria  = args[1]

    case attribute
    when 'first_name' then repo.find_by_first_name(criteria)
    when 'last_name'  then repo.find_by_last_name(criteria)
    when 'email'      then repo.find_by_email(criteria)
    when 'phone'      then repo.find_by_phone(criteria)
    when 'street'     then repo.find_by_street(criteria)
    when 'city'       then repo.find_by_city(criteria)
    when 'state'      then repo.find_by_state(criteria)
    when 'zipcode'    then repo.find_by_zipcode(criteria)
    end
  end

  def queue_sub_menu
    case
    when count?
      printer.display_queue_count(queue.count)
    when clear?
      return printer.fail_message('clear') if queue.attendees.empty?
      queue.clear
      printer.successfully_cleared(queue.count)
    when print?
      print_menu
    when save_to?
      return printer.fail_message('save') if queue.attendees.empty?

      # queue.save_to(filename)
      printer.display_save_info(command[3])
    else
      input_error
    end
  end

  def print_menu
    return printer.display_queue(queue.attendees) if command[2] != 'by'

    #repo.find_by(command[4])
    puts "sorting something to print here..."
  end

  def help_menu
    case
    when count?             then printer.description_count
    when clear?             then printer.description_clear
    when print?             then printer.description_print
    when save_to?           then printer.description_save_to
    when find?(command[1])  then printer.description_find
    when load?(command[1])  then printer.description_load
    when queue?(command[1]) then printer.description_queue
    else
      printer.display_commands
    end
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

  def help?
    command[0] == 'help'
  end

  def count?
    command[1] == 'count'
  end

  def clear?
    command[1] == 'clear'
  end

  def print?
    command[1] == 'print'
  end

  def print_by?
    command[1] == 'print' && command[2] == 'by'
  end

  def save_to?
    command[1] == 'save' && command[2] == 'to'
  end

end
