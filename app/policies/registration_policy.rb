class RegistrationPolicy < ApplicationPolicy
  def new?
    user.superadmin? || user.supervisor? || user.manager?
  end

  def create?
    user.superadmin? || user.supervisor? || user.manager?
  end
end
