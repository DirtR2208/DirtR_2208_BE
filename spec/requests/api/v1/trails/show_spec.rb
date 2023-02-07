require 'rails_helper'

RSpec.describe 'GET /trails/:id' do
  describe "trails show" do
    before :each do
      @boulder = County.create!( name: Faker::Name.name )
      @trail1= @boulder.trails.create!(name: Faker::Mountain.name , latitude: Faker::Address.latitude, longitude:Faker::Address.longitude ,difficulty: Faker::Color.color_name, distance: Faker::Number.non_zero_digit, description: Faker::Lorem.sentence, start_elevation: Faker::Number.binary(digits: 4), avg_duration: "01:12" ,map_image: Faker::LoremFlickr.image(size: "50x60"), thumbnail_image: "trail test" )
    end
    it "returns a success response" do
      get "/api/v1/trails/#{@trail1.id}"
      binding.pry
      expect(response).to be_successful
    end
  end
end




