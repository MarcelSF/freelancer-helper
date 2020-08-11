class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      redirect_to payments_path
    end
  end

  def facts
    # clients (per revenue)
    @clients = money_per_client

    # total revenue (per month/per year)
    @payments = user_payments

    # projected revenue (real payments)
    # projected revenue (paid and not paid)

    # most productive work
    # most reliable clients
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

  def user_payments
    Payment.joins(project: {client: :user}).where(users: {id: current_user.id}).group_by_month(:date_of_payment).sum(:value)
  end
end
