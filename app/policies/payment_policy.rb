class PaymentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(Payment.joins(project: {client: :user}).where(users: {id: user.id}).uniq)
    end
  end

  def new?
    true
  end

  def create?
    new?
  end
end
