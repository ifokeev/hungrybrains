class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token, if: :js?

  protected

    def js?
      request.format.js?
    end

  private
    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

    def not_authenticated
      redirect_to signin_path, alert: "Для просмотра это страницы необходимо авторизоваться"
    end

end
