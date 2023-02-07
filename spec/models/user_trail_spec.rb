require 'rails_helper'

RSpec.describe UserTrail, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :trail }
  end
end