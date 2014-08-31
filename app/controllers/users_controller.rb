class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if params[:type] == "company"
      @user.build_company(name: params[:name])
      @user.roles = [:company]
    else
      @user.build_student
      @user.roles = [:student]
    end

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
