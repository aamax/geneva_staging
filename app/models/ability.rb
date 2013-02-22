class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else
      cannot :manage, :all

      can :read, Event

      can :read, Gallery

      can [:new, :create], Contact
    end

  end
end
