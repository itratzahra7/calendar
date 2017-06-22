class Event
  attr_reader :name, :detail, :venue
  def initialize(name, detail, venue, date)
    @name   = name
    @detail = detail
    @venue  = venue
    @date   = date
  end
end

