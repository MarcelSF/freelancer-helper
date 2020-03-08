class PaymentsController < ApplicationController
  def index
    @payments = current_user.payments
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user = current_user
    @payment.save
    redirect_to payments_path
  end

  private

  def payment_params
    params.require(:payment).permit(:notes, :project_id, :value, :tax_discount, :paid, :date_of_payment)
  end
end
