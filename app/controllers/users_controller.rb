class UsersController < ApplicationController
  def index

  end

  def new
  	@user = User.new
  end

  def edit
  end

  def show
  	@user = User.find_by_id params[:id]
  end

  def create
    @user = User.create user_params
    #set the user.id in the session
    puts user_params
    found_user_by_username = User.where(username: params[:username]).first
    
    if found_user_by_username 
      flash[:error] = "That email already exists. Try something different."
      redirect_to new_user_path
    elsif @user.save
      redirect_to user_clients_path @user
    else
      redirect_to new_user_path
      flash[:error] = "Your information is incomplete or you've chosen a username/email that already exists"
    end

  end

  def update
  end

  def destroy
  end

  private
  def user_params
  	params.require(:user).permit(:id, :name, :username, :password) 
  end

  def find_user
  	@user = User.find params[:id]
  end
end
