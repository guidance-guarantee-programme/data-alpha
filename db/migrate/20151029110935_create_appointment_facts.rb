class CreateAppointmentFacts < ActiveRecord::Migration
  def change
    create_table :appointment_facts do |t|
      t.references :date_dimension, index: true, foreign_key: true
      t.references :channel_dimension, index: true, foreign_key: true
    end
  end
end
