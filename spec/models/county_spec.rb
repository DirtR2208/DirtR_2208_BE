require 'rails_helper'

RSpec.describe County, type: :model do
  describe "Relationships" do
    it { should have_many :trails }
  end

  describe "Validations" do
    it { should validate_presence_of :name }
  end

  describe "Class Methods" do
    before :each do
      @boulder = County.create!( name: "Boulder County")
    end

    describe "#find_by_name" do
      it "finds the county that matches a name arg" do

        expect(County.find_by_name("boulder")).to eq(@boulder)
      end
    end
  end
end
