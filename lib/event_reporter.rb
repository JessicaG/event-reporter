require 'csv'
require_relative './printer'
require_relative './queue'
require_relative './attendee_repo'

#questions:
#
# how to handle the attendee repo. Do we initialize with it? do we reassign is a new fileis loaded? wtf

#nested case statements? wtf holy ugly batman

class EventReporter
  attr_reader :queue, :printer, :repo, :command

  def initialize
    @queue   = Queue.new
    @printer = Printer.new
    @repo    = AttendeeRepo.new
  end

  def run
    printer.welcome_intro
    @command = get_input
    until @command == 'quit'
      menu
      @command = get_input
    end
    printer.goodbye
  end

  private
  def get_input
    printer.prompt
    gets.strip.downcase.split(' ')
  end

  def menu
    case
    when find?(command[0])
      repo.find(command[1], command[2])
    when load?(command[0])
      @repo = AttendeeRepo.new(command[1])
      printer.file_loaded(command[1])
    when queue?(command[0])
      queue_sub_menu
    when help?
      help_menu
    when help?
      printer.goodbye
    else
      input_error
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

  def input_error
    printer.incorrect_entry
    printer.display_commands
  end
end
