class Airport < ApplicationRecord
  has_many :flights_from, class_name: 'Flight', foreign_key: 'origin'
  has_many :flights_to, class_name: 'Flight', foreign_key: 'destination'
end
