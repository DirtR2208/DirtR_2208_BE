class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: UsersSerializer.new(users)
  end

  def show
    # require 'pry'; binding.pry
    id = params[:id]
    # require 'pry'; binding.pry
    if id.present?
      user = User.find_by_user_id(params[:id])
      if user.nil?
        render json: { error: "No User Found" }, status: 404
      else
        render json: UserSerializer.new(user)
      end
    else
      render json: { error: "Provide A User Parameter" }, status: 404
    end
  end

  # def add_favorite(trail)
  #   user = User.find_by(params[:id])
  #   if user.present?
  # end
end