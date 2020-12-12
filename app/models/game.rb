class Game < ApplicationRecord
    has_many :game_scores
    has_many :users, through: :game_scores

    # validates :name, :type, :info
end
