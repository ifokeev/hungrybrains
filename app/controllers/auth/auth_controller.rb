class Auth::AuthController < ApplicationController

  def index
    if logged_in?
        redirect_to root_url
    else
        redirect_to auth_login_url
    end
  end

end
