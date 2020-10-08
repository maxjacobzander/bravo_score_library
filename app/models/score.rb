class Score < ActiveRecord::Base
    belongs_to :user

    validates :title, presence: true
    validates :composer, presence: true
end