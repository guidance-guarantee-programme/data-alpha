class CreateChannelDimensions < ActiveRecord::Migration
  def change
    create_table :channel_dimensions do |t|
      t.string :name, null: false
    end

    add_index :channel_dimensions, :name, unique: true
  end
end
