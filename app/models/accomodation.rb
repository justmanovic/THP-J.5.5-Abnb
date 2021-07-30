class Accomodation < ApplicationRecord
  has_many :rentals
  belongs_to :host, class_name: "User"
  belongs_to :town
end
