class Auth::SessionsController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :require_login, only: [:destroy]

  def new
  end

  def create
    if @user
      redirect_to root_url , :notice => "Logged in!"
    else
      redirect_to auth_login_url, :alert => "Email or password was invalid."
    end
  end
  def destroy
    logout
    redirect_to auth_login_url, :notice => 'Logged out!'
  end

  private
  def set_user
    @user = login(session_params.fetch(:email), session_params.fetch(:password), session_params.fetch(:remember_me))
  end

  def session_params
    params.require(:user).permit(:email, :password, :remember_me)
  end

end
