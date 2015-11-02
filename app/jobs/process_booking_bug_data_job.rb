require 'csv'

class ProcessBookingBugDataJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    CSV.read(*args).each do |row|
      date = Date.parse(row['Date'])

      channel_dimension = ChannelDimension.find_by_name('Phone')
      date_dimension = DateDimension.find_by_date(date.strftime('%-d/%-m/%Y'))

      AppointmentFact.create(channel_dimension: channel_dimension,
                             date_dimension: date_dimension)
    end
  end
end
