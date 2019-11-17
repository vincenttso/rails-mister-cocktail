class Cocktail < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews

  validates :name, presence: true, uniqueness: true, format: { with: /\w+/ }
  validates :description, presence: true, format: { with: /\w+/ }
  validates :photo, presence: true
end
