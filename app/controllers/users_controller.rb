class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
    @collects = @user.creations.desc(:created_at)
    @interviews = @user.interviews.desc(:created_at).page params[:page]
    @user.karma_add(1)
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes(params[:user])
      redirect_to user_path(current_user)
    else
      @user = current_user
      render 'edit'
    end
  end

  def index
    @users = User.desc(:karma).page params[:page]
  end
end
