class ClientsController < ApplicationController
  before_action :set_client, only: [:edit, :update, :show]
  def index
    @clients = policy_scope(Client)

    #@top_clients -> show a top 5 list of clients and their payment total
  end

  def new
    @client = Client.new
    authorize @client
  end

  def show
    @payments = @client.payments
    authorize @client
  end

  def create
    @client = Client.new(client_params)
    @client.user = current_user
    authorize @client
    if @client.save
      redirect_to new_project_path
    else
      render :new
    end
  end

  def edit
    authorize @client
  end

  def update
    @client.update(client_params)
    authorize @client
    if @client.save
      redirect_to client_path(@client)
    else
      render :edit
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :bio, :avatar)
  end

  def set_client
    @client = Client.find(params[:id])
  end

  # def clients_price_hash

  # end
end
