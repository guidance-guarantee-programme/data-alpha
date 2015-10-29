require 'faraday'
require 'icalendar'

class BankHoliday
  attr_reader :date, :name

  def initialize(date: date, name: name)
    self.date = date
    self.name = name
  end

  def ==(other)
    case other
      when Date
        self.date == other
      when BankHoliday
        self.date == other.date
      else
        self <=> other
    end
  end

  def self.england_and_wales
    @england_and_wales ||= ics('england-and-wales')
  end

  def self.scotland
    @scotland ||= ics('scotland')
  end

  def self.northern_ireland
    @northern_ireland ||= ics('northern-ireland')
  end

  private

  attr_writer :date, :name

  def self.ics(country)
    response = Faraday.get("https://www.gov.uk/bank-holidays/#{country}.ics")
    ics = Icalendar.parse(response.body)

    ics.first.events.collect { |event| new(date: event.dtstart, name: event.summary.to_s) }
  end
end
