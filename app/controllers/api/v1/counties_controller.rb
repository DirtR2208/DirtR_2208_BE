class Api::V1::CountiesController < ApplicationController
  def index
    @counties = County.all 
    render json: @counties
  end
end