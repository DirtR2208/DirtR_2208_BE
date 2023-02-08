class User < ApplicationRecord
  has_many :user_trails
  has_many :trails, through: :user_trails

  validates_presence_of :name
  validates_presence_of :email

  def self.find_by_user_id(id)
    # require 'pry'; binding.pry
    where('id = ?', "#{id}")
    .first
  end
end