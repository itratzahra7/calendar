require './event.rb'
class Calendar
  def initialize
    @events = {}
  end  

  def add_event
    while true
      print "Enter the name of Event: "
      name = gets.chomp
      if !name.empty?
        break
      end
    end
    print "Enter the details of Event: "
    detail = gets.chomp
    print "Enter the venue of Event: "
    venue  = gets.chomp
    puts "Enter date"
    date   = get_date
    event  = Event.new(name, detail, venue, date)
    if @events.has_key?(date)
      @events[date] << event
    else 
      event_day = Array.new
      event_day << event
      @events.merge!(date => event_day)
    end
  end
  def show_events
    puts "Enter date: "   
    date = get_date
    if @events[date]
      print "\n"
      puts "Total number of events on #{date}: #{@events[date].length}"
      puts "Event Name\t\tEvent Detail\t\tEvent Venue"
      @events[date].each { |event_info| puts "#{event_info.name}\t\t\t#{event_info.detail}\t\t\t#{event_info.venue}" }
      print "\n"
    else
      print "\n"
      puts "No events on this date"
      print "\n"
    end
  end 
  
 def display_calendar 
    date       = Date.today 
    day        = date.day
    month      = date.month 
    year       = date.year
    start_date = Date.new(year, month, 1)
    last_date  = Date.new(year, month, -1)  
    puts Date::ABBR_DAYNAMES.join("\t")
    print "\n" 
    print "\t" * start_date.wday
    (start_date..last_date).each do |date|  
      print " #{date.day}" 
      if @events[date]
        print "(#{@events[date].length})\t"
      else 
        print "\t"
      end  
      print "\n" if date.saturday?
     end
    print "\n"
  end

  def get_date 
    begin
      while true
        print "Enter Year: "
        year = gets.chomp.to_i
        if year != 0
          break
        end
      end
      while true
        print "Enter month: "
        month = gets.chomp.to_i
        if month != 0
          break
        end
      end
      while true
        print "Enter day: "
        day = gets.chomp.to_i
        if day != 0
          break
        end
      end
      date = Date.new(year, month, day)
    rescue ArgumentError
      puts "Enter date in correct format" 
      retry
    end
  end
end

