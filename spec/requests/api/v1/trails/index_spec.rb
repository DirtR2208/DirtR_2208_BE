require 'rails_helper'

RSpec.describe 'GET /trails' do
    describe "trails index" do
        it " returns all trails " do
            json_response = File.read('spec/fixtures/DO_NOT_DELETE/trails.json')
            stub_request(:get, "http://localhost:3000/api/v1/trails").to_return(status: 200, body: json_response)

            get "/api/v1/trails"

            trails = JSON.parse(json_response, symbolize_names: true)

            expect(trails).to be_a(Hash)
            expect(trails).to have_key(:data)

            expect(trails[:data]).to be_a Array
            expect(trails[:data][0]).to be_a Hash
            expect(trails[:data][0]).to have_key(:id)
            expect(trails[:data][0]).to have_key(:type)
            expect(trails[:data][0]).to have_key(:attributes)
            expect(trails[:data][0][:attributes]).to have_key(:id)
            expect(trails[:data][0][:attributes]).to have_key(:name)
            expect(trails[:data][0][:attributes]).to have_key(:latitude)
            expect(trails[:data][0][:attributes]).to have_key(:longitude)
            expect(trails[:data][0][:attributes]).to have_key(:difficulty)
            expect(trails[:data][0][:attributes]).to have_key(:distance)
            expect(trails[:data][0][:attributes]).to have_key(:description)
            expect(trails[:data][0][:attributes]).to have_key(:start_elevation)
            expect(trails[:data][0][:attributes]).to have_key(:avg_duration)
            expect(trails[:data][0][:attributes]).to have_key(:map_image)
            expect(trails[:data][0][:attributes]).to have_key(:thumbnail_image)
            expect(trails[:data][0][:attributes]).to have_key(:county_id)
        end
    end
end