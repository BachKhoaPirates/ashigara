class Review < ApplicationRecord
  belongs_to :shoe
  belongs_to :user
  has_many :votes

  after_save :update_shoe
  after_destroy :update_shoe

  private

  def calculate_shoe_stat
    @avg_durability = Review.where(shoe_id: shoe_id).average(:durability).to_f.round(2)
    @avg_comfortability = Review.where(shoe_id: shoe_id).average(:comfortability).to_f.round(2)
    @avg_ventilation = Review.where(shoe_id: shoe_id).average(:ventilation).to_f.round(2)
    @avg_overall = ((@avg_durability + @avg_comfortability + @avg_ventilation)/3.0.to_f).round(2)

    @avg_money_worthy = Review.where(shoe_id: shoe_id).average(:money_worthy).to_f.round(2)
  end

  def update_shoe
    calculate_shoe_stat
    Shoe.find_by(id: shoe_id).update_attributes durability: @avg_durability,
      comfortability: @avg_comfortability,
      ventilation: @avg_ventilation,
      overall: @avg_overall,
      money_worthy: @avg_money_worthy
  end
end
