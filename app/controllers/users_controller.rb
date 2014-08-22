class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.build_company
    if @user.save
      auto_login(@user)
      redirect_to root_url, notice: "Success!"
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :remember_me)    
    end
end
