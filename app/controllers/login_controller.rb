# coding: utf-8
class LoginController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  #Log in form
  def new
    #flash[:warning]=nil
  end

  # "Create" a login, aka "log the user in"
  def create
    if (user=User.authenticate(params[:username], params[:password]))
      session[:current_user_id]=user.id
      flash[:notice]=t 'login_greeting'
      redirect_to root_path
    else
      flash[:warning]= t 'login_incorrect'
      redirect_to root_path
    end
  end

  #"Delete" a login, aka "log the user out"
  def destroy
    @_current_user=session[:current_user_id]=nil
    redirect_to root_path
  end
end
