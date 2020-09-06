class User < ApplicationRecord
  EMAIL_FORMAT =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  PASSWORD_FORMAT = /\A[A-Z]+(\.[A-Z]+)?[0-9]*\z/i
  MINIMUM_LENGTH = 8

  has_many :recipes, dependent: :destroy

  before_save :name_capitalize
  before_save :email_to_downcase

  has_secure_password
  
  validates :full_name, presence: true, length: {minimum: MINIMUM_LENGTH}
  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: {case_sensitive: true}, presence: true, format: {with: EMAIL_FORMAT }
  validates :password, presence: true, length: {minimum: MINIMUM_LENGTH},
            format: {with: PASSWORD_FORMAT, :message => 'must contains and starts with letters(numbers can be used last!)'}

  private

  def name_capitalize
    self.full_name = full_name.downcase.titleize
    self.first_name = first_name.downcase.capitalize
    self.last_name = last_name.downcase.capitalize
  end

  def email_to_downcase
    self.email = email.downcase
  end
end

