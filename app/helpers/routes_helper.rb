module RoutesHelper

  def current_user_been_on_route(route)
    current_user.routes.include?(route)
  end

  def forbid_if_user_hasnt_been_on_route(route)
    return head(:forbidden) unless current_user_been_on_route(route)
  end

end
