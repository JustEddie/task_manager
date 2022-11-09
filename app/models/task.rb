class Task < ApplicationRecord
    belongs_to :Category

    validates_presence_of :category
end
