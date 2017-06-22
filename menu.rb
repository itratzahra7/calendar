require 'date'
require_relative 'calendar'

calendar = Calendar.new
while true
  print "\n"
  puts "1: Add new Event"
  puts "2: Show Events"
  puts "3: Display Calendar"
  puts "4: Exit"
  option = gets.to_i
  case option
    when 1
      calendar.add_event
    when 2
      calendar.show_events
    when 3
      calendar.display_calendar
    when 4
      break
    else
      puts "Enter a valid number"
  end
end
