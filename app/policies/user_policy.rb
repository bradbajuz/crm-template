class UserPolicy < ApplicationPolicy
  def index?
    user.superadmin? || user.supervisor? || user.manager?
  end

  def show?
    user.superadmin? || user.supervisor? || user.manager?
  end
end
