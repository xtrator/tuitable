class TweetPolicy < ApplicationPolicy
  def create?
    user
  end

  def destroy?
    user&.admin? || record.user == user
  end

  def update?
    user&.admin? || record.user == user
  end
end
