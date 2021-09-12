class UsersController < ApplicationController
  before_action :user, only: %i[edit]
  def index
    @users = User.all
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    if @user = Users::Create.new(users_params).call
      redirect_to users_path
    else
      render :new
    end      
  end

  def update
    if Users::Update.new(user, user_params).call
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    Users::Destroy.new(user).call
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:admin)
  end

  def users_params
    params.require(:users).permit(:email, :password, :admin)
  end

  def user
    @user ||= User.find(params[:id])
  end
end
