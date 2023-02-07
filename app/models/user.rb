class User < ApplicationRecord
  has_many :trails
  
  validates_presence_of :name
  validates_presence_of :email
end