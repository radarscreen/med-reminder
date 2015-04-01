class ClientsController < ApplicationController
  def index
    @user = User.find_by_id session[:user_id]
    @clients = @user.clients
  end

  def new
    @user = User.find_by_id session[:user_id]
    @client = Client.new
  end

  def edit
    @client = Client.find_by_id params[:id]
  end

  def show
    @user = User.find_by_id session[:user_id]
    @client = Client.find_by_id params[:client_id]
    # @user = @client.user
    @client = @user.client
  end

  def create
    @user = User.find_by_id session[:user_id]
    @client = Client.new client_params
    @client.user = @user   ### i don't think so..after looking in the tables, no assignment of user_id to client.
    #links the client to the user found by id
    @client.save
    #needed to save the changes to @client
    redirect_to client_path(@client)
    #path taken upon creation and because that path requires
    #client specific info, the instance var needs to be passed
  end

  def update
    @client = Client.find_by_id(params[:id])
    @user = User.find_by_id session[:user_id] 
    @client.user_id = session[:user_id]
    if @client.update_attributes client_params
      redirect_to client_path
    else
      flash[:error] = "Client information insufficient. Complete all fields and submit again"
      redirect_to edit_client_path
    end
  end

  def destroy
    user = User.find_by_id session[:user_id]
    client = Client.find_by_id params[:id]
    client.destroy
    redirect_to user_clients_path(user.id)
  end

  private
  def client_params
    params.require(:client).permit(:id, :name, :relationship, :phone_number, :user_id) 
  end
end
