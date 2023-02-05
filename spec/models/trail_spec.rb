require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe "Relationships" do
    it { should belong_to :county }
  end

  describe "Validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
    it { should validate_presence_of :difficulty }
    it { should validate_presence_of :distance }
    it { should validate_presence_of :description }
    it { should validate_presence_of :start_elevation }
    it { should validate_presence_of(:avg_duration).allow_nil }
    it { should validate_presence_of :map_image }
    it { should validate_presence_of :thumbnail_image }
  end
end
