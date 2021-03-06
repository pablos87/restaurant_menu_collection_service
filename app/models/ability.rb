class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can [:new, :create], Import
    can :index, Place
    can :show, Menu
  end
end
