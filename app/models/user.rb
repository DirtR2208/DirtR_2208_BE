class User < ApplicationRecord
  has_many :user_trails
  has_many :trails, through: :user_trails

  validates_presence_of :name
  validates_presence_of :email
end