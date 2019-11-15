class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true, format: { with: /\w+/ }
  validates :description, presence: true, format: { with: /\w+/ }
  validates :image_url, presence: true
end
