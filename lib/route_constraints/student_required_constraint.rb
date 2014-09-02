class RouteConstraints::StudentRequiredConstraint
  include RouteConstraints::UserConstraint

  def matches?(request)
    user = current_user(request)
    user.present? && (user.has_role? :student)
  end
end