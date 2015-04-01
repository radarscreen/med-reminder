class UsersController < ApplicationController
  def index
    @users = User.all
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
    find_user_by_username = User.where(username: params[:username]).first
    
    if find_user_by_username 
      flash[:error] = "That email already exists. Try something different."
      redirect_to new_user_path
    elsif @user.save
      session[:user_id] = @user.id
      flash[:success] = "You successfully created an account! Add your client info below."
      redirect_to new_user_client_path @user
    else
      redirect_to new_user_path
      flash[:error] = "Your information is incomplete or you've chosen a username/email that already exists"
    end

# # def create
#     @user = User.create(user_params)
#     if @user.save
#       session[:user_id] = @user.id
#       flash[:success] = "You are now logged in!"
#       redirect_to user_path(@user)
#     else
#       render :signup
#     end
#     end

  end

  def update
  end

  def login
  end

  def attempt_login
   if params[:username].present? && params[:password].present?
       find_user = User.where(username: params[:username]).first
      if find_user
         authorized_user = find_user.authenticate(params[:password])
         session[:user_id] = authorized_user.id
         redirect_to user_clients_path (authorized_user)
      else
         flash[:notice] = "Failed username/password"
         render :login
      end
      # else
      #    flash[:notice] = "Failed username/password"
      #        render :login
      # end
   end
  end
   
  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
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
