class Recipe < ApplicationRecord
 MINIMUM_LENGTH = 6

  belongs_to :user

  has_many :instructions, dependent: :destroy
  has_many :ingredients, dependent: :destroy

  accepts_nested_attributes_for :ingredients, :instructions, allow_destroy: true

  validates :description, presence: true, length: { minimum: MINIMUM_LENGTH }
end
