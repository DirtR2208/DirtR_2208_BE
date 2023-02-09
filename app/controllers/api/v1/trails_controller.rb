class Api::V1::TrailsController < ApplicationController

  def index
    trails = Trail.all
    render json: TrailsSerializer.new(trails)
  end

  def show
  id = params[:id]
    if id.present?
      trail = Trail.find_by_id(id)
      if trail.nil?
        render json: { error: "No Trail Found" }, status: 404
      else
        render json: TrailSerializer.new(trail)
      end
    else
      render json: { error: "Provide A Trail Id"}, status: 404
    end
  end
end
