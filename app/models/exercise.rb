class Exercise < ApplicationRecord
  has_many :rounds
  has_many :workouts, :through => :rounds
end
