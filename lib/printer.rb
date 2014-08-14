require 'colorize'
require 'terminal-table'

class Printer
  def intro
    puts "---------------------------".blue
    puts " Welcome to Event Reporter".white
    puts "---------------------------\n".blue
    puts "Type: `Menu`, `Help` or enter a command\n\n"
  end

  def incorrect_entry
    puts "\nIncorrect Entry".red
  end

  def display_commands
    puts "\n------------------------------------------------------------------"
    puts "`#{'load'.cyan} #{'<filename>'.blue}`              - find attendee"
    puts "`#{'find'.red} #{'<attribute>'.blue} #{'<criteria>'.blue}`  - find attendee"
    puts "`#{'queue'.cyan} #{'count'.cyan}`                  - counts attendees in queue"
    puts "`#{'queue print'.red}`                  - displays attendees in queue"
    puts "`#{'queue'.cyan} #{'print by'.cyan} #{'<attribute>'.blue}`   - displays specific attendees"
    puts "`#{'queue save to'.red} #{'<filename>'.blue}`     - exports attendees in queue"
    puts "`#{'queue'.cyan} #{'clear'.cyan}`                  - clears queue"
    puts "`#{'help'.red}`                         - help menu"
    puts "`#{'help'.cyan} #{' <command>'.blue}`              - command help"
    puts "`#{'menu'.red}`                         - display menu"
    puts "`#{'quit'.cyan}`                         - exit"
    puts "------------------------------------------------------------------\n\n"
  end

  def help_commands
    puts "\n------------------------------------------------------------------"
    puts "`#{'help'.red}`                         - help menu"
    puts "`#{'help'.cyan} #{' <command>'.blue}`              - command help"
    puts "options: count | clear | print | save to | find | load | queue"
    puts "------------------------------------------------------------------\n\n"
  end

  def display_queue_count(count)
    puts "\nQueue count: #{count}\n".cyan
  end

  def successfully_cleared(count)
    display_queue_count(count)
    puts "Queue successfully cleared.\n".green
  end

  def fail_message(type)
    puts "\nNo data to #{type}. The queue is empty.\n".red
  end

  def display_queue(queue)
    rows = Array.new
    queue.each do |a|
      rows << [a.last_name, a.first_name, a.email_address, a.zipcode, a.city, a.state, a.street, a.home_phone,]
    end
    table = Terminal::Table.new :headings => ['LAST NAME', 'FIRST NAME', 'EMAIL', 'ZIPCODE', 'CITY', 'STATE', 'ADDRESS', 'PHONE'], :rows => rows

    puts "\n\n#{table}\n\n"
  end

  def failed_save
     puts "\nNo data to save. The queue is empty.\n".red
  end

  def display_save_info(filename)
    puts "\nFile exported to data/#{filename}.csv\n".cyan
  end

  def outro
    puts "\nGoodbye\n".cyan
  end

  def file_loaded(filepath)
    puts "\n#{filepath} successfully loaded\n".green
  end

  def prompt
    print '> '.blue
  end

  def description_count
    puts "\n#{'`queue count`'.cyan} - returns the total number of attendee records in the current queue."
    puts "\n#{'see also:'.red} #{'`help queue`'.cyan}\n\n"
  end

  def description_clear
    puts "\n#{'`queue clear`'.cyan} - Removes all attendee records from the current queue."
  end

  def description_print
    puts "\n#{'`queue print`'.cyan} - Displays a data table of all attendee records in the current queue."

    puts "#{'`queue print by <attribute>`'.cyan} - Displays a data table of all attendee records in the current queue sorted by a specific attribute."
  end

  def description_save_to
    puts "\n#{'`queue save to <filename>`'.cyan} - Exports all data in the current queue to a csv with a name of your choosing. No need to add the .csv extension."
  end

  def description_find
    puts "\n#{'`find <attribute> <criteria>`'.cyan} - Searches Event Data for attandees that meet a specific search criteria."
  end

  def description_load
    puts "\n#{'`load <filename>`'.cyan} - Uploads a new data file for Event Reporter to perform searches on."
  end

  def description_queue
    puts "\n#{'`help queue`'.cyan} - The Queue holds all of the data from the current search until it is exported, cleared, or the next search is executed using the #{`find <attribute> <criteria>`.cyan} command."
  end

  def print_by(results)
    rows = Array.new
    results.each do |r|
      rows << [r.last_name, r.first_name, r.email_address, r.zipcode, r.street, r.city, r.state, r.home_phone]
    end
    table = Terminal::Table.new :headings => ['LAST NAME', 'FIRST NAME', 'EMAIL', 'ZIPCODE', 'CITY', 'STATE', 'ADDRESS', 'PHONE'], :rows => rows
    puts "\n\n#{table}\n\n"
  end

  def no_results
    puts "\nNo data to display\n\n".red
  end

end
