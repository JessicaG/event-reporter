require 'csv'

class EventReporter
  attr_reader :queue

  def initialize
    @queue = Queue.new
  end
  def run
    puts "Welcome to Event Reporter"
    puts 'Please choose from the menu'
    user_input = gets.strip.downcase
    parse_user_input(user_input)
  end

  def parse_user_input(user_input)
    #load 'data/acrobats_anonymous.rb'
    arr = user_input.split(' ')
    command       = arr[0]
    option_two    = arr[1]
    option_three  = arr[2]
    option_four   = arr[3]
  end

  def menu(sanitized_input)
    case sanitized_input
    when 'load'
      AttendeeRepo.new(filepath)
    when 'help'
      if sanitized_input.count == 1
        help_menu
      else
        help(command)
      end
    when 'queue count'
      queue.count
    when 'queue clear'
      queue.clear
    when 'queue print'
      queue.display
    when 'queue print by <attribute>'
      queue.print_by(attribute)
    when 'queue save to <filename.csv>'
      queue.save_to(filename)
    when 'find <attribute> <criteria>'
      find(attribute, criteria)
    else
      incorrect_entry
      help_menu
    end
  end

  def incorrect_entry
    puts 'Incorrect Entry'
  end

  def help_menu
    puts "`help`                         - help menu"
    puts "`help <command>`               - command help"
    puts "`queue count`                  - counts attendees in queue"
    puts "`queue clear`                  - clears queue"
    puts "`queue print`                  - displays attendees in queue"
    puts "`queue print by <attribute>`   - displays specific attendees"
    puts "`queue save to <filename.csv>` - exports attendees in queue"
  end

  def help(command)
    case command
    when 'count'    then puts "printer.description('count')"
    when 'clear'    then puts "printer.description('clear')"
    when 'print'    then puts "printer.description('print')"
    when 'print by' then puts "printer.description('print_by')"
    when 'save to'  then puts "printer.description('save_to')"
    when 'find'     then puts "printer.description('find')"
  end
end
