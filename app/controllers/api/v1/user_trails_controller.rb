class Api::V1::UserTrailsController < ApplicationController
  def create
    if UserTrail.create(user_id: params[:user_id], trail_id: params[:trail_id])
      render json: { 'success': 'Trail Added Successfully.' }, status: 201
    end
  end

  def index

  end
end