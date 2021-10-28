class Workout < ApplicationRecord
  # validates :name, :presence => true
  has_many :rounds
  belongs_to :user, :optional => true
end
