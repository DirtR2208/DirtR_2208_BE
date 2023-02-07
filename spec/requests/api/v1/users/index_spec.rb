require 'rails_helper'

RSpec.describe 'GET /users' do
  describe 'when the records exist' do
    it 'returns all users in json format' do
      json_response = File.read('spec/fixtures/DO_NOT_DELETE/users.json')
      stub_request(:get, "http://localhost:3000/api/v1/users").to_return(status: 200, body: json_response)

      user = User.create!(name: "name", email: "email@dirtr.dirt")

      get "/api/v1/users"

      users = JSON.parse(json_response, symbolize_names: true)
    end
  end
end