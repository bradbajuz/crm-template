class CompanyPolicy < ApplicationPolicy
  def new?
    user.superadmin? || user.supervisor? || user.manager?
  end

  def edit?
    user.superadmin? || user.supervisor? || user.manager?
  end
end
