class Api::V1::CountiesController < ApplicationController
  def index
    counties = County.all
    render json: CountiesSerializer.new(counties)
  end

  def show
    name = params[:name]
    if name.present?
      county = County.find_by_name(name)
      if county.nil?
        render json: { error: "No County Found" }, status: 404
      else
        render json: CountySerializer.new(county)
      end
    else
      render json: { error: "Provide A Name Parameter" }, status: 404
    end
  end

  def add_favorite(trail)
    require 'pry'; binding.pry
  end
end
