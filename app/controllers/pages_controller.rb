class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if user_signed_in?
      redirect_to payments_path
    end
  end

  def facts
    # top clients (per revenue)
    # total revenue (per month/per year)
    # most productive work
    # most reliable clients
    # projected revenue
    # Revenue spread across the year
  end
end
