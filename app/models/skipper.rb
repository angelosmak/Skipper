class Skipper < ApplicationRecord
  has_one_attached :video
  has_one_attached :cv
  has_one_attached :docs
  has_one_attached :photo
  belongs_to :user  # Skipper belongs to a User (this will use user_id as the foreign key)

end
