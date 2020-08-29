class Recipe < ApplicationRecord

  belongs_to :user

  has_many :instructions, dependent: :destroy
  has_many :ingredients, dependent: :destroy

  accepts_nested_attributes_for :ingredients, :instructions, allow_destroy: true


  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 20 }
end
