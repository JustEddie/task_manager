class User < ApplicationRecord
  has_many :categories
  has_many :comments
  has_many :tasks, through: :categories

  validates :first_name, presence: true
  validates :password, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
end
