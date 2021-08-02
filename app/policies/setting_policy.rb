class SettingPolicy < ApplicationPolicy
  def index?
    user.superadmin? || user.supervisor? || user.manager? || user.tech?
  end
end
