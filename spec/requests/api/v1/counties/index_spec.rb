require 'rails_helper'

RSpec.describe 'GET /counties' do
  describe "when the records exist" do
    it 'expects a successful response' do
      get "/api/v1/counties"

      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it 'returns Counties' do
      get "/api/v1/counties"

      counties = JSON.parse(response.body, symbolize_names: true)

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
end
