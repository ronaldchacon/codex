class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role? :free
      can :manage, Wiki, user_id: user.id
    end

    if user.role? :premium
      # can :create, Collaboration
      can :read, Wiki
    end

    if user.role? :admin
      can :manage, :all
    end

    can :read, Wiki, public: true
  end
end
