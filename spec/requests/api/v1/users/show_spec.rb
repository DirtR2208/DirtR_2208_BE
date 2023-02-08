require 'rails_helper'

RSpec.describe 'GET /user' do
  describe 'when the records exist' do
    it 'returns a specified user and their favorite trails in json' do
      # json_response = File.read('spec/fixtures/DO_NOT_DELETE/shawn.json')
      # stub_request(:get, "http://localhost:3000/api/v1/user?id=3").to_return(status: 200, body: json_response)

      # shawn = JSON.parse(json_response, symbolize_names: true)
      Rails.application.load_tasks
      Rake::Task['csv_load:all'].invoke
      get "/api/v1/user?id=3"

      shawn = JSON.parse(response.body, symbolize_names: true)

      expect(shawn).to be_a(Hash)
    end
  end
end