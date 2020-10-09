class Score < ActiveRecord::Base
    belongs_to :user

    validates :title, :composer, presence: true

    scope :ordered, -> { order('title asc') }
    scope :ordered_by_composer, -> { order('composer asc') }
end