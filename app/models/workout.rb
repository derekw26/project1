class Workout < ApplicationRecord
  # validates :name, :presence => true

  has_many :rounds
  has_many :exercises, :through => :rounds

  belongs_to :user
end
