class Review < ApplicationRecord
  belongs_to :shoe
  belongs_to :user
  has_many :votes
end
