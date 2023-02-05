require 'rails_helper'

RSpec.describe 'counties index' do
  it 'returns a json formatted list of counties' do
    la_plata = County.create!(name: "La Plata")
    montezuma = County.create!(name: "Montezuma")
    boulder = County.create!(name: "Boulder")
    summit = County.create!(name: "Summit")

    get '/api/v1/counties'

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)
    counties = parsed[:data]

    expect(counties).to be_an(Array)
    expect(counties.count).to eq(4)
    expect(counties.first.keys).to include(
      :id,
      :type,
      :attributes
    )
    expect(counties.first[:id]).to be_a(String)
    expect(counties.first[:type]).to eq('county')
    expect(counties.first[:attributes].keys).to include(
      :name
    )
    expect(counties.first[:attributes][:name]).to be_a(String)
    expect(counties.first[:attributes][:name]).to eq('La Plata')
    expect(counties.first).to_not have_key(:population)
    expect(counties.first).to_not have_key(:capitol)
  end
end