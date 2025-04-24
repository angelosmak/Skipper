class Booking < ApplicationRecord
  belongs_to :skipper
  validates :date, presence: true
end
