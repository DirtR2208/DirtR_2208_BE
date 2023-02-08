require 'rails_helper'

RSpec.describe 'GET /trails/:id' do
  describe "trails show" do
    it "returns a success response" do
      json_response = File.read('spec/fixtures/DO_NOT_DELETE/boulder.json')
      stub_request(:get, "http://localhost:3000/api/v1/counties").to_return(status: 200, body: json_response)
      trails = JSON.parse(json_response, symbolize_names: true)

      id = trails[:data][:attributes][:trails].first[:id]

      get "/api/v1/trails/#{id}"
      expect(trails).to be_a Hash
      expect(trails[:data]).to be_a Hash
      expect(trails[:data]).to have_key :id
      expect(trails[:data][:id]).to be_a String
      expect(trails[:data]).to have_key :type
      expect(trails[:data][:type]).to be_a String
      expect(trails[:data]).to have_key :attributes
      expect(trails[:data][:attributes]).to be_a Hash
      expect(trails[:data][:attributes]).to have_key :name
      expect(trails[:data][:attributes][:name]).to be_a String
      expect(trails[:data][:attributes]).to have_key :trails
      expect(trails[:data][:attributes][:trails]).to be_a Array

    end
  end
end




