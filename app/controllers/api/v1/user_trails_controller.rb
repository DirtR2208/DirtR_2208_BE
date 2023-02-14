class Api::V1::UserTrailsController < ApplicationController

  def create
    user_trail = UserTrail.new(user_id: params[:user_id], trail_id: params[:trail_id])
    if user_trail.save
      render json: { 'success': 'Trail Added Successfully' }, status: 200
    else
      render json: { 'error': 'Trail Not Saved' }, status: 200
    end
  end

  def destroy
    if user_trail.present?
      user_trail.delete
      render json: { 'success': 'Trail Remove from favorites' }, status: 200
    else
      render json:{ 'error': 'Trail not found'}, status: 404
    end
  end

  def user_trail
    UserTrail.find_by(params[:id])
  end
end
