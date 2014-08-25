class OmniauthCallbacksController < ApplicationController
  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}

        if "#{provider}".include? "student"
          profile_type = "student"
        else
          profile_type = "company"
        end

        @user = User.find_or_create_by_oauth(env["omniauth.auth"], profile_type, current_user)

        if @user
          auto_login(@user)
          redirect_to root_url, notice: "Success!"
        else
          redirect_to root_url, error: "Login error"
        end
      end
    }
  end

  [:twitter_student, :twitter_company, :facebook_student, :facebook_company, :vkontakte_student, :vkontakte_company].each do |provider|
    provides_callback_for provider
  end
end