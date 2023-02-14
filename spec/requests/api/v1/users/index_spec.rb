require 'rails_helper'

RSpec.describe 'GET /users' do
  describe 'when the records exist' do
    it 'returns all users in json format' do
      json_response = File.read('spec/fixtures/DO_NOT_DELETE/users.json')
      
      users = JSON.parse(json_response, symbolize_names: true)

      expect(users).to be_a Hash
      expect(users).to have_key :data

      expect(users[:data]).to be_an Array
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