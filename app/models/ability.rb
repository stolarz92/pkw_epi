class Ability
  include CanCan::Ability

=begin
  def initialize(user, controller_namespace)
    case controller_namespace
      when 'Admin'
        can :manage, :all if user.admin?
      when 'Central'
        can :manage, :all if user.central?
      else
        can :manage, :all if user.regional?
        # rules for non-admin controllers here
    end
    end
=end

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    if user.admin?
      can :manage, :all
    elsif user.central?
      can :read, :all
    elsif user.regional?
      can :read, Constituency do |constituency|
        constituency.try(:user) == user
      end
      can :edit, Constituency do |constituency|
        constituency.try(:user) == user
      end
      can :update, Constituency do |constituency|
        constituency.try(:user) == user
      end
      can [:read,], Committee
      can [:create, :read, :edit, :update], Vote
    end
  end
end
