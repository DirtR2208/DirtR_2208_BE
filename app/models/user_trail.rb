class UserTrail < ApplicationRecord
  validates :user_id, uniqueness: { scope: :trail_id }

  belongs_to :user
  belongs_to :trail
end