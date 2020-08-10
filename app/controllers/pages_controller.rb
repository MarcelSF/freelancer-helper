class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      redirect_to payments_path
    end
  end

  def facts
    @clients = money_per_client
    @payments = policy_scope(Payment)
    # top clients (per revenue)
    # total revenue (per month/per year)
    # most productive work
    # most reliable clients
    # projected revenue (real payments)
    # projected revenue (imagined monthly)
  end

  private

  def money_per_client
    clients = Client.where(user: current_user)
    clients_hash = {}
    clients.each do |client|
      clients_hash[client.name] = client.payments.sum("value")
    end
    clients_hash
  end
end
