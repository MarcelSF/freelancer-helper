class PaymentsController < ApplicationController
  before_action :skip_authorization, only: :index
  def index
    @payments = policy_scope(Payment).joins(project: {client: :user}).where(users: {id: current_user.id}).order(created_at: :desc).includes(:project)
    @chart_payments = policy_scope(Payment).joins(project: {client: :user}).where(users: {id: current_user.id}).group_by_month(:created_at).sum(:value)
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
