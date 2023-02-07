require 'rails_helper'

RSpec.describe 'GET /trails/:id' do
  describe "trails show" do
    it 'should ' do

    get "/api/v1/trails/#{:id}"
    expect(response).to be_successful
    end
  end
end


