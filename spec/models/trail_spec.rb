require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
    it { should validate_presence_of :difficulty }
    it { should validate_presence_of :distance }
  end
end
