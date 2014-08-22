class SessionsController < ApplicationController
  before_action :set_user, only: [:create]
  before_action :require_login, only: [:destroy]

  def new
  end

  def create    
    if @user
      redirect_back_or_to root_url , :notice => "Logged in as " + @user.email
    else
      redirect_to signin_url, :alert => "Email or password was invalid."
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => 'Logged out!'
  end

  private
  
    def set_user
      @user = login(params[:email], params[:password], params[:remember_me])
    end
end
