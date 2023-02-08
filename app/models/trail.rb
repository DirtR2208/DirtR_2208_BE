class Trail < ApplicationRecord
  belongs_to :county
  validates_presence_of :name
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :difficulty
  validates_presence_of :distance
  validates_presence_of :description
  validates_presence_of :start_elevation
  validates_presence_of :avg_duration, :allow_nil => true
  validates_presence_of :map_image
  validates_presence_of :thumbnail_image

  def self.find_by_id(id)
    where(id: id)
  end
end
