class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.projects
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def show?
    record.user == user
  end
end
