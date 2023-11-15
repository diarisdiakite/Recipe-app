class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  validates :name, presence: true, length: { maximum: 250 }

  scope :public_recipes, -> { where(public: true) }
  scope :private_recipes, -> { where(public: false) }
end
