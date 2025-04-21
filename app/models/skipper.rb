class Skipper < ApplicationRecord
  has_one_attached :video
  has_one_attached :cv
  has_one_attached :docs
  has_one_attached :photo
end
