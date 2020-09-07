class PaymentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.joins(project: {client: :user}).where(users: {id: user.id})
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def show?
    user == record.project.client.user
  end
end
