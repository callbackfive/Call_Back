class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new(role: :guest)
    
    can :read, Project

    if user.admin?
      can :manage, :all
    else user.regular?
      can :manage, Project, user_id: user.id
    end

  end
end
 