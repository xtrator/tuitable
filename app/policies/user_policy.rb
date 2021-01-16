class UserPolicy < ApplicationPolicy
  def update?
    user == record
  end

  def destroy?
    user&.admin? || user == record
  end
end
