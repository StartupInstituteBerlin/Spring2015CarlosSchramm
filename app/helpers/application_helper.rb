module ApplicationHelper
  def current_users_and_owners
    current_user && current_user.owner?
  end
end
