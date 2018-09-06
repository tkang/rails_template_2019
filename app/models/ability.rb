class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user
      give_logged_in_user_permission(user)
    else
      give_visitor_permission
    end
  end

  private

  def give_visitor_permission
  end

  def give_logged_in_user_permission(user)
    can :manage, :all
  end

end
