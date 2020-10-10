class Score < ActiveRecord::Base
    belongs_to :user

    validates :title, :composer_last, presence: true

    scope :ordered, -> { order('title asc') }
    scope :ordered_by_composer, -> { order('composer_last asc') }
end