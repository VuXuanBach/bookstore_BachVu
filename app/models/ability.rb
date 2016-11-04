class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :read, :all                   # allow everyone to read everything
    if user.admin?
      can :manage, :all
    end
  end
end
