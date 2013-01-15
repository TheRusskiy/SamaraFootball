class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  #just go render "New" template...
    @user=User.new
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
      user[:position] = params[:user][:position]
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
  end

  def edit
    if ((not current_user.nil?) && current_user.id.to_s==params[:id] )
    @user = User.find(params[:id])
    else
      flash[:warning]="You are not allowed to edit other profiles!"
      current_user=nil
      redirect_to root_path
    end
  end

  def update
    #Is password right?
    #This check is needed in order to prevent malicious calls from outside a browser
    user = User.authenticate(params[:login],params[:password])
    if user.nil?
      flash[:warning]="Wrong credentials! Stop messing with my program!"
      redirect_to root_path
    else
    #Check if login available
      existing_user = User.find_by_login(params[:user][:login])
      #Login is unavailable! :-(
      if not ( existing_user.nil? || existing_user.id.to_s==params[:id])
        flash[:warning]="User with login \"#{params[:user][:login]}\" already exists!"
        redirect_to edit_user_path(user.id)
        return
      end
      if ( params[:user][:login].length<4 or params[:user][:password].length<6)
        flash[:warning]="Password or Nickname is too short!"
        redirect_to edit_user_path(user.id)
        return
      end
      #Everything cool! Go create new user
        user[:login]= params[:user][:login]
        user[:password] = params[:user][:password]
        user[:first_name] = params[:user][:first_name]
        user[:last_name] = params[:user][:last_name]
        user[:position] = params[:user][:position]
        user.save
        if user.errors.any?
          flash[:warning]="Some Error occurred!"
          redirect_to root_path
        else
          flash[:notice]="Your profile was updated!"
          redirect_to user_path(user.id)
        end

    end
  end

end
