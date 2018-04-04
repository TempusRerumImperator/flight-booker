class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :origin
      t.integer :destination
      t.datetime :depart_time
      t.datetime :arrive_time

      t.timestamps
    end
  end
end
