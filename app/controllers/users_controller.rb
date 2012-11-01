class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @collects = @user.creations
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes(params[:user])
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end
end
