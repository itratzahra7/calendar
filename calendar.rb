require_relative 'event'
class Calendar
  def initialize
    @events = {}
  end

  def add_event
    while true
      print "Enter the name of Event: "
      name = gets.chomp
      break unless name.empty?
    end
    print "Enter the details of Event: "
    detail = gets.chomp
    print "Enter the venue of Event: "
    venue  = gets.chomp
    puts "Enter date: "
    date   = get_date
    event  = Event.new(name, detail, venue, date)
    if @events[date]
      @events[date] << event
    else
      day_events = Array.new
      day_events << event
      @events.merge!(date => day_events)
    end
  end
  def show_events
    puts "Enter date: "
    date = get_date
    if @events[date]
      print "\n"
      puts "Total number of events on #{date}: #{@events[date].length}"
      @events[date].each do |event_info|
        puts "Event Name  : #{event_info.name}"
        puts "Evnet Detail: #{event_info.detail}"
        puts "Event Venue : #{event_info.venue}"
        print "\n"
      end
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
      print "(#{@events[date].length})" if @events[date]
      print "\t"
      print "\n" if date.saturday?
     end
    print "\n"
  end

  def get_date
    begin
      while true
        print "Enter Year: "
        year = gets.to_i
        break unless year == 0
      end
      while true
        print "Enter month: "
        month = gets.to_i
        break unless month == 0
      end
      while true
        print "Enter day: "
        day = gets.to_i
        break unless day == 0
      end
      date = Date.new(year, month, day)
    rescue ArgumentError
      puts "Enter date in correct format"
      retry
    end
  end
end
