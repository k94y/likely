class Admin::WidgetsController  < ActionController::Base
   # ...

   private

   def current_ability
     # I am sure there is a slicker way to capture the controller namespace
     controller_name_segments = params[ :controller ].split('/')
     controller_name_segments.pop
     controller_namespace = controller_name_segments.join('/').camelize
     @current_ability ||= Ability.new(current_user, controller_namespace)
   end
 end

class Ability
  include CanCan::Ability

  def initialize(user)
    #Default permissions.
    can :read, :all

    user ||= User.new #ログインしていないときはUserモデルクラスをインスタンス化する。
    if user.admin?
      can :manage, :all     #管理者に対する権限付与
    end


    if user.customer?

        cannot :manage, :"admin::users"

    end

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
  end
end
