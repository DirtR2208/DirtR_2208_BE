class Trail < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :difficulty
  validates_presence_of :distance
end
