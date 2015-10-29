require 'bank_holiday'

class DateDimension < ActiveRecord::Base
  def self.create_from_date(date)
    is_last_day_of_month = date == date.end_of_month ? 'Yes' : 'No'
    quarter = ((date.month - 1) / 3) + 1
    weekday_weekend = date.saturday? || date.sunday? ? 'Weekend' : 'Weekday'

    england_and_wales_bank_holiday = BankHoliday.england_and_wales.find { |d| d == date }.try(:name)
    scotland_bank_holiday = BankHoliday.scotland.find { |d| d == date }.try(:name)
    northern_ireland_bank_holiday = BankHoliday.northern_ireland.find { |d| d == date }.try(:name)

    bank_holiday = [england_and_wales_bank_holiday,
                    scotland_bank_holiday,
                    northern_ireland_bank_holiday].uniq.compact.join(', ')

    attributes = {
      date: date.strftime('%-d/%-m/%Y'),
      date_name: date.to_s(:govuk_date),
      day: date.day,
      month: date.month,
      year: date.year,
      day_of_week: date.wday,
      day_of_month: date.mday,
      day_of_year: date.yday,
      calendar_week: date.cweek,
      calendar_week_day: date.cwday,
      calendar_week_year: date.cwyear,
      weekday: date.strftime('%A'),
      weekday_abbreviated: date.strftime('%a'),
      month_name: date.strftime('%B'),
      month_name_abbreviated: date.strftime('%b'),
      weekday_weekend: weekday_weekend,
      is_last_day_of_month: '',
      quarter: quarter,
      quarter_name: quarter.ordinalize,
      year_month: [date.year, date.month].join('-'),
      year_quarter: [date.year, quarter].join('-'),
      bank_holiday: bank_holiday.blank? ? nil : bank_holiday,
      england_and_wales_bank_holiday: england_and_wales_bank_holiday,
      scotland_bank_holiday: scotland_bank_holiday,
      northern_ireland_bank_holiday: northern_ireland_bank_holiday
    }

    create(attributes)
  end
end
