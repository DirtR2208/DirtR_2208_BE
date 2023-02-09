require 'rails_helper'

RSpec.describe 'POST /user-trails' do
  describe 'when user id is valid' do
    it 'adds a trail to that users list of favorite trails' do
      shawn = User.create!(
        id: 3,  
        name: "Shawn Lee",
        email: "shawn@dirtr.dirt"
      )
      county = County.create!(
        id: 27,
        name: "Boulder"
      )
      trail = Trail.create!(
        id: 163,
        name: "Jenny Creek Trail ",
        latitude: "39.929561",
        longitude: "-105.624647",
        difficulty: "black",
        distance: "2.2",
        description: "Jenny Creek Trail is a lesser-used trail that goes from Yankee Doodle Lake Eldora Ski area. In it motorized 2 track and in summer is an out-and-back from Rollins pass road or Jenny Creek Road with no summer access through Eldora.",
        start_elevation: "10,732 ft",
        avg_duration: "0:25:11",
        map_image: "https://ep1.pinkbike.org/trailstaticmap/563000/563447_3_500x200.png",
        thumbnail_image: "https://adventr.co/wp-content/uploads/2015/01/DSC03243.jpg",
        county_id: 27
      )

      headers = { "Content-Type": "application/json", Accept: "application/json" }
      body = ( {
        "user_id": 3,
        "trail_id": 163
      } )

      # stub_request(:post, "http://localhost:3000/api/v1/user-trails").to_return(status: 201, body: "Trail Added Successfully")

      post '/api/v1/user-trails', headers: headers, params: JSON.generate(body)
      # require 'pry'; binding.pry
      expect(response).to be_successful
      parsed = JSON.parse(response.body, symbolize_names: true)
      expect(parsed).to eq({ "success": "Trail Added Successfully." })

    end
  end
end