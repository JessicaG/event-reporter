require 'colorize'
require 'pry'

class Printer
  def intro
    puts "---------------------------".blue
    puts " Welcome to Event Reporter".white
    puts "---------------------------\n\n".blue
  end

  def incorrect_entry
    puts "\nIncorrect Entry".red
  end

  def display_commands
    puts "\n------------------------------------------------------------------"
    puts "`#{'load'.cyan} #{'<filename>'.blue}`              - find atendee"
    puts "`#{'find'.red} #{'<attribute>'.blue} #{'<criteria>'.blue}`  - find atendee"
    puts "`#{'queue'.cyan} #{'count'.cyan}`                  - counts attendees in queue"
    puts "`#{'queue print'.red}`                  - displays attendees in queue"
    puts "`#{'queue'.cyan} #{'print by'.cyan} #{'<attribute>'.blue}`   - displays specific attendees"
    puts "`#{'queue save to'.red} #{'<filename>'.blue}`     - exports attendees in queue"
    puts "`#{'queue'.cyan} #{'clear'.cyan}`                  - clears queue"
    puts "`#{'help'.red}`                         - help menu"
    puts "`#{'help'.cyan} #{' <command>'.blue}`              - command help"
    puts "`#{'quit'.red}`                         - exit"
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
    puts "\n\n--------------------------------------------------------------------------------".blue
    puts "  LAST NAME\tFIRST NAME\tEMAIL\tZIPCODE\tCITY\tSTATE\tADDRESS\tPHONE".cyan
    puts '--------------------------------------------------------------------------------'.blue
    return puts "\nNo data to display\n\n".red if queue.empty?
    queue.each do |attendee|
      print "#{attendee.last_name} #{attendee.first_name}\t#{attendee.email_address} #{attendee.city}\n"
    end
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
    print results
  end

end
