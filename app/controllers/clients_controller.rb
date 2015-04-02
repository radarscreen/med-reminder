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
    @client = Client.find_by_id params[:id]
    # @user = @client.user
    @user = User.find_by_id params[:user_id]
    @client.user = @user
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

  skip_before_action :verify_authenticity_token

  # def notify
  #   # all this needs to be read from the DB and put in a loop
  #   twilio_account_sid = "ACc60adc4a320ca37f4599e5b18e8f7547"
  #   twilio_auth_token = "e721ded781e0691afc17ad3c6672fe4d"
  #   body_text = 'IMPORTANT Medication Reminder ' + 'from ' + @user.name + ': ' + @client.name + ' needs to take ' + @medicine.quantity + ' of ' + @medicine.name + ' now.'
    
  #   clients = Client.all

  #   clients.each do |client|
  #     if client.notification
  #       # need to wrap this in error handling
  #       to_number = '+1' + client.phone_number    
  #       from_number = '+12089364709'
  #       client = Twilio::REST::Client.new twilio_account_sid, twilio_auth_token

  #       message = client.account.messages.create(:body => body_text,
  #           :to => to_number,
  #           :from => from_number)
  #       puts message.to

  #     end
  #   end
  # end
 

  def client_params
    params.require(:client).permit(:name, :relationship, :phone_number, :user_id) 
  end
end
