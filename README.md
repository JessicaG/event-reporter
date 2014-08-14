Event Reporter
==============

Event Reporter is an interactive query and reporting admin tool for events. Data is uploaded via CSV and then loaded into the program viat the `load` command and file path. Users can then query the data in the file based on the header attributes, print to the screen, sort by column, and export their findings to CSV.

The program is based on the "queue". The queue holds the stored results from a previous search. As a user, I issue a search command to find records, then later issue another command to do work with those results. The queue is not cleared until the user runs the command `queue clear` or a new `find` command.

To run, simply clone the repo and start via the terminal using `ruby event_manager.rb`. From there you can type `Menu` or `Help` for a full list of searchable commands.
