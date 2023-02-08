class Api::V1::TrailsController < ApplicationController

  def show
    id = params[:id]
    trail = Trail.find_by_id(id)
    render json: TrailSerializer.new(trail)
  end
end
