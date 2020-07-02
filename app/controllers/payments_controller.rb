class PaymentsController < ApplicationController
  def index
    @payments = policy_scope(Payment)
  end

  def show
    @project = Project.find(params[:id]).includes(:payments)
    authorize @project
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
end
