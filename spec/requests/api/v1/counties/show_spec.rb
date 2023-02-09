require 'rails_helper'

RSpec.describe 'GET /counties' do
  describe "when the records exist" do
    it 'returns Counties' do
      Rails.application.load_tasks
      Rake::Task['csv_load:all'].invoke
      get "/api/v1/county?name=boulder"

      boulder = JSON.parse(response.body, symbolize_names: true)
      
      expect(boulder).to be_a Hash
      expect(boulder).to have_key :data
      expect(boulder[:data]).to be_a Hash

      expect(boulder[:data]).to have_key :id
      expect(boulder[:data][:id]).to be_a String
      expect(boulder[:data]).to have_key :type
      expect(boulder[:data][:type]).to be_a String
      expect(boulder[:data]).to have_key :attributes

      expect(boulder[:data][:attributes]).to be_a Hash
      expect(boulder[:data][:attributes]).to have_key :name
      expect(boulder[:data][:attributes][:name]).to be_a String
      expect(boulder[:data][:attributes]).to have_key :trails
      expect(boulder[:data][:attributes][:trails]).to be_a Array
      expect(boulder[:data][:attributes][:trails].count).to be > 0

      expect(boulder[:data][:attributes][:trails].first).to be_a Hash
      expect(boulder[:data][:attributes][:trails].first).to have_key :id
      expect(boulder[:data][:attributes][:trails].first[:id]).to be_a Integer
      expect(boulder[:data][:attributes][:trails].first).to have_key :name
      expect(boulder[:data][:attributes][:trails].first).to have_key :latitude
      expect(boulder[:data][:attributes][:trails].first).to have_key :longitude
      expect(boulder[:data][:attributes][:trails].first).to have_key :difficulty
      expect(boulder[:data][:attributes][:trails].first).to have_key :distance
      expect(boulder[:data][:attributes][:trails].first).to have_key :description
      expect(boulder[:data][:attributes][:trails].first).to have_key :created_at
      expect(boulder[:data][:attributes][:trails].first).to have_key :updated_at
      expect(boulder[:data][:attributes][:trails].first).to have_key :start_elevation
      expect(boulder[:data][:attributes][:trails].first).to have_key :avg_duration
      expect(boulder[:data][:attributes][:trails].first).to have_key :map_image
      expect(boulder[:data][:attributes][:trails].first).to have_key :thumbnail_image
      expect(boulder[:data][:attributes][:trails].first).to have_key :county_id
    end
  end

  describe "When there are no records" do
    it "returns an error" do
      get "/api/v1/county?name=bould3r"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response).to have_http_status(404)

      expect(json).to be_a Hash
      expect(json).to have_key :error
      expect(json[:error]).to eq("No County Found")
    end
  end

  describe "When there is no name parameter" do
    it "returns an error" do
      get "/api/v1/county"

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response).to have_http_status(404)
    end
  end
end
