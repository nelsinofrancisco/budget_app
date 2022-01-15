class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present? # additional permissions for logged in users

    can :manage, User, id: user.id
  end
end
