class Api::V1::CountiesController < ApplicationController
  def index
    counties = County.all
    render json: CountySerializer.new(counties)
  end
end
