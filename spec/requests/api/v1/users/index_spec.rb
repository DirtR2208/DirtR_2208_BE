require 'rails_helper'

RSpec.describe 'GET /users' do
  describe 'when the records exist' do
    it 'returns all users in json format' do
      json_response = File.read('spec/fixtures/DO_NOT_DELETE/users.json')
      stub_request(:get, "http://localhost:3000/api/v1/users").to_return(status: 200, body: json_response)

      user = User.create!(name: "name", email: "email@dirtr.dirt")

      get "/api/v1/users"

      users = JSON.parse(json_response, symbolize_names: true)

      expect(users).to be_a Hash
      expect(users).to have_key :data

      expect(users[:data]).to be_a Array
      expect(users[:data].first).to be_a Hash

      expect(users[:data].first).to have_key :id
      expect(users[:data].first).to have_key :type
      expect(users[:data].first).to have_key :attributes

      expect(users[:data].first[:id]).to be_a String
      expect(users[:data].first[:type]).to be_a String
      expect(users[:data].first[:attributes]).to be_a Hash

      expect(users[:data].first[:attributes]).to have_key :name
      expect(users[:data].first[:attributes]).to have_key :email

      expect(users[:data].first[:attributes][:name]).to be_a String
      expect(users[:data].first[:attributes][:email]).to be_a String
    end
  end
end