class CreatePassengers < ActiveRecord::Migration[5.1]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :surname
      t.string :email

      t.timestamps

      create_table :passengers_bookings do |t|
        t.belongs_to :passengers, index: true
        t.belongs_to :bookings, index: true
      end
    end
  end
end
