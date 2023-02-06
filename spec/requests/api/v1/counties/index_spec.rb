require 'rails_helper'

RSpec.describe 'GET /counties' do
  describe "when the records exist" do
    it 'returns Counties' do
      json_response = File.read('spec/fixtures/DO_NOT_DELETE/counties.json')
      stub_request(:get, "http://localhost:3000/api/v1/counties").to_return(status: 200, body: json_response)

      get "/api/v1/counties"

      counties = JSON.parse(json_response, symbolize_names: true)

      expect(counties).to be_a Hash
      expect(counties).to have_key :data

      expect(counties[:data]).to be_a Array
      expect(counties[:data].first).to be_a Hash

      expect(counties[:data].first).to have_key :id
      expect(counties[:data].first).to have_key :type
      expect(counties[:data].first).to have_key :attributes

      expect(counties[:data].first[:id]).to be_a String
      expect(counties[:data].first[:type]).to be_a String
      expect(counties[:data].first[:attributes]).to be_a Hash

      expect(counties[:data].first[:attributes]).to have_key :name

      expect(counties[:data].first[:attributes][:name]).to be_a String
    end
  end

  describe "when records DNE" do
    it 'returns a blank array' do
      get "/api/v1/counties"

      counties = JSON.parse(response.body, symbolize_names: true)

      expect(counties[:data]).to eq([])
    end
  end
end
