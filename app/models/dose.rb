class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :cocktail_id, :ingredient_id, :measurement, :unit, presence: true
  validates :measurement, numericality: { only_integer: true }
  validates_uniqueness_of :cocktail_id, scope: [:ingredient_id]
end
