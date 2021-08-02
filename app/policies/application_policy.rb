class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @record = record
  end

  def index?
    user.present?
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    user.superadmin? || user.supervisor? || user.manager? || user.tech?
  end

  def new?
    create?
  end

  def update?
    user.present? && (user.superadmin? || user.supervisor? || user.manager? || user.tech?)
  end

  def edit?
    update?
  end

  def destroy?
    update?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "must be logged in" unless user
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
