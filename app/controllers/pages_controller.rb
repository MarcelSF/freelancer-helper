class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      redirect_to payments_path
    end
  end

  def facts
    @payments = policy_scope(Payment)
    @clients = current_user.clients
    # top clients (per revenue)
    # total revenue (per month/per year)
    # most productive work
    # most reliable clients
    # projected revenue (real payments)
    # projected revenue (imagined monthly)
  end
end
