class Api::V1::UserTrailsController < ApplicationController
  def create
    if !user_valid
      render json: { 'error': 'No User Found' }, status: 200
    else 
      UserTrail.create(user_id: params[:user_id], trail_id: params[:trail_id])
      render json: { 'success': 'Trail Added Successfully' }, status: 200
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

  private
  def user_valid
    @user = User.find_by(params[:id])
    !@user.nil?
  end
    def user_trail
      UserTrail.find_by(params[:id])
    end
end
