class UsersController < ApplicationController
  def new
    redirect_to home_path if signed_in?
  end

  def show
    render json: current_user
  end
end
