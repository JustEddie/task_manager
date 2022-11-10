class Task < ApplicationRecord
    belongs_to :category

    # validates_presence_of :category
    def completed?
        !completed_at.blank?
    end
end
