#encoding: utf-8
module SessionsHelper

  def current_user?(user)
    user == current_user
  end

end