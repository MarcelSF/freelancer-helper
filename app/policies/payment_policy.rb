class PaymentPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user  = user
      @scope = Payment.joins(project: {client: :user}).where(users: {id: user.id}).uniq
    end

    def resolve
      scope
    end
  end

  def new?
    true
  end

  def create?
    new?
  end
end
