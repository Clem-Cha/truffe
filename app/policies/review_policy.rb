class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def true?
    return true
  end

  def create?
    true
  end
end
