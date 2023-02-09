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

  describe "#find_by_id" do
    it "finds the county that matches a id arg" do
      county = County.create!(name: "test")
      trail = Trail.create!(name: "test", latitude: "1", longitude: "1", difficulty: "b", distance: "1", description: "....", start_elevation: "1234", avg_duration: "1", map_image: "https", thumbnail_image: "https1", county_id: county.id )

      expect(Trail.find_by_id(trail.id)).to eq(trail)
    end
  end
end
