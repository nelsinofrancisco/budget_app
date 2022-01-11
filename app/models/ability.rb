class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present? # additional permissions for logged in users

    can :manage, User, id: user.id
    can :manage, Group, user_id: user.id
    can :manage, UserTransaction, author_id: user.id
    can :manage, TransactionGroup, group_id: { user_id: user.id }
  end
end
