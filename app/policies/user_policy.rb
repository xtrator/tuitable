class UserPolicy < ApplicationPolicy
  def update?
    user == record
  end

  def destroy?
    user == record
  end
end