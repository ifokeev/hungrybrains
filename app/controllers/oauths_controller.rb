class OauthsController < ApplicationController
  skip_before_filter :require_login
  
  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    # @user = User.new
    # @user.email = @user_hash[:user_info]["email"]

    # @user.password = "qweqwe"
    # @user.build_student(name: @user_hash[:user_info]["first_name"],
    #                     surname: @user_hash[:user_info]["last_name"])
    # @user.roles = [:student]
    # img_url = get_img_url
    # @user.student.avatar_from_url(img_url)
    # if @user.save
    #   auto_login(@user)
    #   redirect_to edit_student_path(@user.student), notice: "Success!"
    # else
    #   redirect_to root_path, :alert => "Failed to login from #{provider.titleize}!"
    # end
    
    if @user = login_from(provider)
      redirect_to root_path, :notice => "Logged in from #{provider.titleize}!"
    else
      begin
        @user = create_from(provider)
        sorcery_fetch_user_hash(provider)

        #@user.email = @user_hash[:user_info]["email"]
        #@user.password = @user.email
        @student = User.find(@user.id)
        @student.build_student(name: @user_hash[:user_info]["first_name"],
                            surname: @user_hash[:user_info]["last_name"])
        @student.roles = [:student]
        img_url = get_img_url
        @student.student.avatar_from_url(img_url)
        @student.save
        
        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to profile_path, :notice => "Logged in from #{provider.titleize}!"
      rescue
        # render :text => @user.email
        redirect_to root_path, :alert => "Failed to login from #{provider.titleize}!"
      end
    end
  end
  
  private
    def auth_params
      params.permit(:code, :provider)
    end

    def get_img_url
      url = URI.parse("http://graph.facebook.com/v2.1/#{@user_hash[:user_info]["id"]}/picture?redirect=0&type=large&height=200&width=200")
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) { |http|
        http.request(req)
      }
      body = JSON.parse(res.body)
      body["data"]["url"]
    end
end
