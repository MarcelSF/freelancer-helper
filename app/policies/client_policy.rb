class ClientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.clients
    end
  end

  def new?
    true
  end

  def create?
    new?
  end
end