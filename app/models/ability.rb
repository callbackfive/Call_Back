class Ability
  include CanCan::Ability
  def initialize(user)
    can :read, Project

    if user.present?  # additional permissions for logged in users (they can read their own posts)
      can :read, Project, user_id: user.id
    end
  end
end
