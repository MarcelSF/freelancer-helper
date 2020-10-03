class ClientsController < ApplicationController
  def index
    @clients = policy_scope(Client)

    #@top_clients -> show a top 5 list of clients and their payment total
  end

  def new
    @client = Client.new
    authorize @client
  end

  def show
    @client = Client.find(params[:id])
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

  private

  def client_params
    params.require(:client).permit(:name, :bio)
  end

  # def clients_price_hash

  # end
end
