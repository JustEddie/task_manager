class User < ApplicationRecord
    has_many :categories
    has_many :comments
    has_many :tasks, through :categories
end
