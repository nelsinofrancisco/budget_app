# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present? # additional permissions for logged in users
    can :manage, :all
  end
end
