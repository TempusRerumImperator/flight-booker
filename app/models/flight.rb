class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport', foreign_key: 'origin'
  belongs_to :destination, class_name: 'Airport', foreign_key: 'destination'
  has_many :bookings
end
