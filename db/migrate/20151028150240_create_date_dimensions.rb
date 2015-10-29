class CreateDateDimensions < ActiveRecord::Migration
  def change
    create_table :date_dimensions do |t|
      t.string :date, null: false
      t.string :date_name, null: false
      t.integer :day, null: false
      t.integer :month, null: false
      t.integer :year, null: false
      t.integer :day_of_week, null: false
      t.integer :day_of_month, null: false
      t.integer :day_of_year, null: false
      t.integer :calendar_week, null: false
      t.integer :calendar_week_day, null: false
      t.integer :calendar_week_year, null: false
      t.string :weekday, null: false
      t.string :weekday_abbreviated, null: false
      t.string :month_name, null: false
      t.string :month_name_abbreviated, null: false
      t.string :weekday_weekend, null: false
      t.string :is_last_day_of_month, null: false
      t.integer :quarter, null: false
      t.string :quarter_name, null: false
      t.string :year_month, null: false
      t.string :year_quarter, null: false
      t.string :bank_holiday
      t.string :england_and_wales_bank_holiday
      t.string :scotland_bank_holiday
      t.string :northern_ireland_bank_holiday
    end

    add_index :date_dimensions, :date, unique: true
    add_index :date_dimensions, :date_name, unique: true
  end
end
