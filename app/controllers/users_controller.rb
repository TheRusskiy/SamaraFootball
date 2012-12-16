class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  #just go render "New" template...
  end

  def create
    #Check if login available
    existing_user = User.find_by_login(params[:user][:login])
    #Login is unavailable! :-(
    if not existing_user.nil?
      flash[:warning]="User with login \"#{params[:user][:login]}\" already exists!"
      redirect_to new_user_path
    else
    #Everything cool! Go create new user
      user = User.new
      user[:login]= params[:user][:login]
      user[:password] = params[:user][:password]
      user[:first_name] = params[:user][:first_name]
      user[:last_name] = params[:user][:last_name]
      user.save
      if user.errors.any?
        flash[:warning]="Some Error occurred!"
        redirect_to root_path
      else
        flash[:notice]="User #{user[:login]} was created!"
        redirect_to root_path
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @self=false;
  end
end
