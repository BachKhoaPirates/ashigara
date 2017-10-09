class Shoe < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :shoe_images
  has_many :reviews
end
