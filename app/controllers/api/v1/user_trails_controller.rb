class Api::V1::UserTrailsController < ApplicationController
  def create
    user = User.find_by(id: params[:id])
    if user.present?
      UserTrail.create(user_id: params[:user_id], trail_id: params[:trail_id])
      render json: { 'success': 'Trail Added Successfully' }, status: 200
    else 
      render json: { 'error': 'No User Found'}
    end
  end

  def index

  end
end