class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.role == "institution" || user.role == "admin"
  end

  def create?
    new?
  end

  def destroy?
    user.role == "institution" || user.role == "admin"
  end
end
