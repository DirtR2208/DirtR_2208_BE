class Api::V1::UserTrailsController < ApplicationController
  def create
    user_trail = UserTrail.new(user_id: params[:user_id], trail_id: params[:trail_id])
    if user_trail.save
      render json: { 'success': 'Trail Added Successfully' }, status: 200
    else 
      render json: { 'error': 'No User Found' }, status: 200
    end
    # if !user_valid
    #   render json: { 'error': 'No User Found' }, status: 200
    # else 
    #   UserTrail.create(user_id: params[:user_id], trail_id: params[:trail_id])
    #   render json: { 'success': 'Trail Added Successfully' }, status: 200
    # end
  end

  # private

  # def user_valid
  #   @user = User.find_by(params[:id])
  #   !@user.nil?
  # end
end