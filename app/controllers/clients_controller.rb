class ClientsController < ApplicationController
  def index
    @user = User.find_by_id params[:user_id]
    @clients = @user.clients
  end

  def new
  end

  def edit
  end

  def show
    @user = User.find_by_id params[:id]
    @clients = @user.clients
  end

  def create
  end

  def update
  end

  def destroy
  end

  def user_params
    params.require(:client).permit(:name, :relationship, :phone_nubmer, :user_id) 
  end
end
