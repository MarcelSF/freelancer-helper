class ClientsController < ApplicationController
  def index
    @clients = policy_scope(Client)
  end

  def new

  end

  def create

  end
end
