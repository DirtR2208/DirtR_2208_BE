class Trail < ApplicationRecord
  belongs_to :county
  validates_presence_of :name
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :difficulty
  validates_presence_of :distance
  validates_presence_of :description
  validates_presence_of :start_elevation
  validates_presence_of :avg_duration
  validates_presence_of :map_image
  validates_presence_of :thumbnail_image
end
