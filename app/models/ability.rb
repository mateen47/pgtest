# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= Appuser.new # guest user (not logged in)


      if user.user_type == 'manager'
        can :manage, Project do |project|
            project.appusers.include?(user)
        end
      end
      if user.id != nil
        can :read, Project do |project|
            project.appusers.include?(user)
        end
      end
      if user.user_type == 'manager'
        can :delete, Appuser
        can :selectproject, Appuser
        can :addproject, Appuser
        can :edit, Appuser
      elsif user.id != nil
        can :edit, Appuser
      end
      can :create, Appuser
      can :read, Appuser
      if user.user_type == 'qa'
        can :manage, Bug do |bug|
            bug.appusers.include?(user)
        end
      end
      if user.id != nil
        can :read, Bug do |bug|
            bug.appusers.include?(user)
        end
      end

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
  end
end
