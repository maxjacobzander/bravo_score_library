class Score < ActiveRecord::Base
    belongs_to :user

    validates :title, :composer, presence: true
end