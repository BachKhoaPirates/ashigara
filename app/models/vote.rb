class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :review, :counter_cache => true

  validates_uniqueness_of :user_id, :scope => :review_id
end
