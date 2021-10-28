class Round < ApplicationRecord
  belongs_to :workouts, :optional => true
end
