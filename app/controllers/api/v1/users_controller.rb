class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: UsersSerializer.new(users)
  end

  def show

  end
end