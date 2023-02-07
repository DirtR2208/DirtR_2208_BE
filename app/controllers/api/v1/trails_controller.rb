class Api::V1::TrailsController < ApplicationController

  def show
    @trail = Trail.find(params[:id])

  end
end