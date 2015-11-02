class AppointmentFact < ActiveRecord::Base
  belongs_to :date_dimension
  belongs_to :channel_dimension
end
