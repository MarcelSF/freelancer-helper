class ClientPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.clients
    end
  end
end
