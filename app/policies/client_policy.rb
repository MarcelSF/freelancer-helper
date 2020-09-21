class ClientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.clients
    end
  end

  def show?
    record.user = user

  end

  def new?
    true
  end

  def create?
    new?
  end
end
