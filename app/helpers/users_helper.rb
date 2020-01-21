module UsersHelper

  def confirm_id(id)
    who_they_claim = User.find(id)
    raise who_they_claim.inspect
    return head(:forbidden) unless current_user == who_they_claim
  end

end
