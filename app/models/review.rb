class Review < ApplicationRecord
  belongs_to :cocktail

  validates :cocktail_id, :content, :rating, :user, presence: true
  validates :content, :user, format: { with: /\w+/ }
  validates :cocktail_id, :user, uniqueness: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: [1, 2, 3, 4, 5] }
end
