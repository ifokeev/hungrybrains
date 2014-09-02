class RouteConstraints::CompanyRequiredConstraint
  include RouteConstraints::UserConstraint

  def matches?(request)
    user = current_user(request)
    user.present? && (user.has_role? :company)
  end
end