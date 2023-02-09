class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: UsersSerializer.new(users)
  end

  def show
    id = params[:id]
    if id.present?
      user = User.find_by_user_id(id)
      if user.nil?
        render json: { error: "No User Found" }, status: 404
      else
        render json: UserSerializer.new(user)
      end
    else
      render json: { error: "Provide A User Parameter" }, status: 404
    end
  end
end