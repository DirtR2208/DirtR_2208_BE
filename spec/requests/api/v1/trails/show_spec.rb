require 'rails_helper'

RSpec.describe 'GET /trails/:id' do
  describe "trails show" do
    it "returns a success response" do
      json_response = File.read('spec/fixtures/DO_NOT_DELETE/trail.json')
      stub_request(:get, "http://localhost:3000/api/v1/trail?id=2").to_return(status: 200, body: json_response)

      get "/api/v1/trail?id=2"

      trails = JSON.parse(json_response, symbolize_names: true)

      expect(trails).to be_a Hash
      expect(trails[:data]).to be_a Array
      expect(trails[:data][0]).to have_key :id
      expect(trails[:data][0]).to have_key :type
      expect(trails[:data][0]).to have_key :attributes
      expect(trails[:data][0][:attributes]).to have_key :id
      expect(trails[:data][0][:attributes]).to have_key :name
      expect(trails[:data][0][:attributes]).to have_key :latitude
      expect(trails[:data][0][:attributes]).to have_key :longitude
      expect(trails[:data][0][:attributes]).to have_key :difficulty
      expect(trails[:data][0][:attributes]).to have_key :distance
      expect(trails[:data][0][:attributes]).to have_key :description
      expect(trails[:data][0][:attributes]).to have_key :start_elevation
      expect(trails[:data][0][:attributes]).to have_key :avg_duration
      expect(trails[:data][0][:attributes]).to have_key :map_image
      expect(trails[:data][0][:attributes]).to have_key :thumbnail_image
      expect(trails[:data][0][:attributes]).to have_key :county_id
    end

    it " returns an error if no id is provided " do

      get "/api/v1/trail?id="

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end

    it " returns an error if id doesnt exists" do

      get "/api/v1/trail?id=165"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end




