class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:show, :index]

  def show
    @user = User.find(params[:id]) || not_found
    @interviews = @user.interviews.desc(:created_at).page params[:page]
    @collects = @interviews.reduce [] do |products, interview|
      interview.valid_answers.each do |answer|
        products.concat answer.ref_products
      end
      products
    end.uniq
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
