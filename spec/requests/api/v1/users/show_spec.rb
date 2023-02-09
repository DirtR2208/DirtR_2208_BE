require 'rails_helper'

RSpec.describe 'GET /user' do
  describe 'when the records exist' do
    it 'returns a specified user and their favorite trails in json' do
      json_response = File.read('spec/fixtures/DO_NOT_DELETE/shawn.json')
      stub_request(:get, "http://localhost:3000/api/v1/user?id=3").to_return(status: 200, body: json_response)

      shawn = JSON.parse(json_response, symbolize_names: true)
      
      expect(shawn).to be_a(Hash)
      expect(shawn).to have_key(:data)
      expect(shawn[:data]).to be_a(Hash)

      expect(shawn[:data]).to have_key(:id)
      expect(shawn[:data][:id]).to be_a(String)
      expect(shawn[:data]).to have_key(:type)
      expect(shawn[:data][:type]).to be_a(String)
      expect(shawn[:data]).to have_key(:attributes)

      expect(shawn[:data][:attributes]).to be_a(Hash)
      expect(shawn[:data][:attributes]).to have_key(:name)
      expect(shawn[:data][:attributes][:name]).to be_a(String)
      expect(shawn[:data][:attributes]).to have_key(:trails)
      expect(shawn[:data][:attributes][:trails]).to be_a(Array)
    end
  end

  describe 'when there are no records' do
    it 'returns an error' do
      get '/api/v1/user?id=897'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response).to have_http_status(404)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:error)
      expect(json[:error]).to eq("No User Found")
    end
  end

  describe 'when there is no user id parameter' do
    it 'returns an error' do
      get '/api/v1/user'

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response).to have_http_status(404)

      expect(json).to be_a(Hash)
      expect(json).to have_key(:error)
      expect(json[:error]).to eq("Provide A User Parameter")
    end
  end
end