class ClientsController < ApplicationController
  def index
    @clients = policy_scope(Client)
  end

  def new
    @client = Client.new
    authorize @client
  end

  def create
    @client = Client.new(client_params)
    @client.user = current_user
    authorize @client
    if @client.save
      redirect_to new_payment_path
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :bio)
  end
end
