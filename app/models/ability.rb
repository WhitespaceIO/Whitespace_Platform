class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      Rails.logger.debug "ADMIN #{user.email}"
      can :manage, Project
      can :manage, Phase
      can :manage, Proposal
      can :manage, User
      can :manage, Comment
      can :manage, Resource
    elsif user.role? :user
      Rails.logger.debug "USER #{user.email}"
      can :create, Project
      can :read, Project
      can :read, Phase
      can :create, Proposal
      can :manage, Proposal do |u|
        u == user
      end
      can :create, Resource
      can :manage, Resource do |u|
        u == user
      end
      can :manage, Comment do |u|
        u == user
      end
    else
      Rails.logger.debug "GUEST #{user.email}"
      can :read, Project
      can :read, Phase
      can :read, Proposal
      can :read, Comment
      can :read, User
      can :read, Resource
    end
  end
end
