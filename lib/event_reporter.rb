require 'csv'
require 'pry'

class EventReporter
  attr_reader :printer, :command, :menu, :args

  def initialize
    @printer = Printer.new
    @menu    = Menu.new
    @command = ''
    @args    = ''
  end

  def run
    printer.intro
    input = get_input
    @command, *@args = input.split
    until quit?
      command_menu
      @command = get_input
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
    when 'find'  then printer.display_query(menu.find_menu(args))
    when 'load'  then menu.load_menu(args)
    when 'queue' then menu.queue_sub_menu
    when 'help'  then menu.help_menu
    when 'quit'  then printer.goodbye
    else
      input_error
    end
  end

  def input_error
    printer.incorrect_entry
    printer.display_commands
  end

  def quit?
    command == 'quit'
  end
end
