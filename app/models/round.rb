class Round < ApplicationRecord
  belongs_to :exercises, :optional => true
  belongs_to :workouts, :optional => true
end
