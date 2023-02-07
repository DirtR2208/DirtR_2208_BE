class County < ApplicationRecord
  has_many :trails

  validates_presence_of :name

  def self.find_by_name(name)
    where('name ILIKE ?', "%#{name}%")
    .first
  end
end
