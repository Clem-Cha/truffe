class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    create?
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def update_status?
    record.dog.user == user
  end

  def destroy?
    record.user == user
  end
end
