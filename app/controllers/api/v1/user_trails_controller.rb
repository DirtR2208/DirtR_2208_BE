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
      render json: { 'success': 'Trail Removed From Favorites' }, status: 200
    else
      render json: { 'error': 'Trail Not Found' }, status: 404
    end
  end

  private

  def user_trail
    UserTrail.find_by(user_id: params[:user_id], trail_id: params[:trail_id])
  end
end
