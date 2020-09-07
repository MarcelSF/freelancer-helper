class PaymentsController < ApplicationController
  before_action :skip_authorization, only: :index
  def index
    @payments = policy_scope(Payment).order(created_at: :desc).includes(:project)
    @chart_payments = policy_scope(Payment).group_by_day(:date_of_payment).sum(:value)
    @yearly_earnings = user_yearly_earnings
  end

  def show
    @payment = Payment.find(params[:id]).includes(:project)
    authorize @payment
  end

  def new
    @payment = Payment.new
    authorize @payment
  end

  def create
    @payment = Payment.new(payment_params)
    authorize @payment
    @payment.save
    redirect_to payments_path
  end

  private

  def payment_params
    params.require(:payment).permit(:notes, :project_id, :value, :tax_discount, :paid, :date_of_payment)
  end

  def user_yearly_earnings
    policy_scope(Payment).where('extract(year from payments.created_at) = ?', Time.now.year).sum(:value)
  end
end
