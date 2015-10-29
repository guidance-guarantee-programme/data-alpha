require 'date'

begin_date = Date.parse('2015-01-01')
end_date = Date.today

(begin_date..end_date).each do |date|
  DateDimension.create_from_date(date)
end
