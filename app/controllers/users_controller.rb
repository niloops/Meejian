class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
    @collects = @user.creations.desc(:created_at)
    @interviews = @user.interviews.desc(:created_at)
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
