class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.is? :admin
      can :manage, :Project
      can :manage, :Phase
      can :manage, :Proposal
      can :manage, :Member
      can :manage, :Comment
    elsif user.is? :user
      can :read, :Project
      can :read, :Phase
      can :create, :Proposal
      can :manage, :Proposal do |u|
        u == user
      end
      can :manage, :Comment do |u|
        u == user
      end
    else
      can :read, :Project
      can :read, :Phase
      can :read, :Proposal
      can :read, :Comment
      can :read, :Member
    end
  end
end
