class UsersController < ApplicationController
  before_action :user, only: %i[edit]
  def index
    @users = User.all
  end

  def edit
  end

  def update
    if user.update(user_params)
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  def destroy
    if user.destroy
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :email, :admin)
  end

  def user
    @user ||= User.find(params[:id])
  end
end
