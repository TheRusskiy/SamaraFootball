# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  #before_filter :assign_user
  #before_filter :require_login
  #Get user info
  def assign_user
    if @_current_user.nil?
      current_user
    end
  end

#  find the user with ID from session
  private
  def current_user
    @_current_user ||= session[:current_user_id]&&
        User.find(session[:current_user_id])
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    I18n.locale="ru"
  end

  helper_method :current_user

  def require_login
    unless logged_in?
      flash[:warning] = "Чтобы получить доступ к этой странице вы должны залогинится!"
      redirect_to login_form_path # halts request cycle
    end
  end

  # The logged_in? method simply returns true if the user is logged
  # in and false otherwise. It does this by "booleanizing" the
  # current_user method we created previously using a double ! operator.
  # Note that this is not common in Ruby and is discouraged unless you
  # really mean to convert something into true or false.
  def logged_in?
    !!current_user
  end
end
