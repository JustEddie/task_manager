class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks

    validates :name, presence: true

    accepts_nested_attributes_for :tasks
   attr_accessor :tasks
end
