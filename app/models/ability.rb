class Ability
  include CanCan::Ability

  def initialize(user, controller_namespace)
    user ||= User.new  # ログインしていない場合は、からユーザーを用意し判定に用いる
    can :read, :all     #デフォルトで全て読み取り可能とする

    case controller_namespace
      when 'Admin'
=begin
    when 'Admin'のAdminはapplication_controller.rbの
    current_abilityメソッドにて作成。
=end
        if user.admin?  #enumを用いて判断
            #管理者権限
            #can :嫌煙, :範囲
            can :manage, :all
        else
            #一般ユーザーに対する制限項目
            cannot :manage, :contact
            cannot :manage, :genre
            cannot :manage, :label
            cannot :manage, :product
            cannot :manage, :top
            cannot :manage, :user

        end
      else
        # rules for non-admin controllers here
    end
  end
end