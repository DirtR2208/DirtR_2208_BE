class Api::V1::UserTrailsController < ApplicationController
  def create
    user_trail = UserTrail.new(user_id: params[:user_id], trail_id: params[:trail_id])
    if user_trail.save
      render json: { 'success': 'Trail Added Successfully' }, status: 200
    else 
      render json: { 'error': 'No User Found' }, status: 200
    end
  end
end