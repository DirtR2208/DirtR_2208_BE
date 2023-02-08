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
      #scription:"helo",start_elevation:"3",avg_duration:":04",map_image:"SSS",thumbnail_image:"ss",county_id:"#{@boulder.id}" )
      @trail = 164
      expect(Trail.find_by_id(164)).to eq(@trail)
    end
  end
  end
