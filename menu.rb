require 'date'
require_relative 'calendar.rb'

cal = Calendar.new
while true
  puts ""
  puts "1: Add new Event"
  puts "2: Show Events "
  puts "3: Display Calendar"
  puts "4: Exit"
  option = gets.chomp.to_i
  case option
    when 1
      cal.add_event
    when 2
      cal.show_events
    when 3
      cal.display_calendar
    when 4
      break
    else
      puts "Enter a valid number"
  end
end
