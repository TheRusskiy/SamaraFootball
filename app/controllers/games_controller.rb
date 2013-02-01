# coding: utf-8
class GamesController < ApplicationController
  def index
    @games = Game.all
  end
  def new
    if current_user.nil?
      flash[:warning]=t 'login_request'
      redirect_to login_form_path
    else
    #  render "NEW" template
      @game=Game.new
    end
   end

   def create
     @game = Game.new(params[:game])
     #if @game.price<0
     #  flash[:warning]="Цена не может быть < 0, спустись на землю!"
     #  render new_game_path
     #  return
     #end
     #if @game.place=="" or @game.place.nil?
     #  flash[:warning]="Играть то где будем? Укажи место!"
     #  render new_game_path
     #  return
     #end
     #
     #if @game.date<Date.today or (@game.date==Date.today&&@game.time<(Time.now.getutc+Time.now.utc_offset))
     #  flash[:warning]="Нельзя создать игру в прошлом!"
     #  render new_game_path
     #  return
     #end

    if current_user.nil?
      flash[:warning]=t 'login_request'
      redirect_to login_form_path
      return
    else
     @game[:creator]=current_user.id
    end


     if @game.save
       flash[:notice]=t 'game_created', :game => @game.to_s
       redirect_to game_path(@game.id)
     else
       flash[:warning]=@game.error_report
       render new_game_path
     end

   end

   def show
     @game = Game.find(params[:id])
     @users=@game.users
   end


  def edit
    @game = Game.find(params[:id])
    game_owner_validation!
   end

   def destroy
      @game=Game.find(params[:id])
      game_owner_validation!
      if @game.delete
        flash[:notice]=t 'game_deleted', :game => @game.to_s
      else
        flash[:warning]=@game.errors.full_messages
     end
     redirect_to games_path
   end

   def update
     @game = Game.find(params[:id])
     game_owner_validation!
     if @game.update_attributes(params[:game])
       flash[:notice]=t 'game_updated', :game=> @game.to_s
       redirect_to game_path(@game.id)
     else
       flash[:warning]=@game.error_report
       redirect_to edit_game_path(@game.id)
     end
   end

  def register_for_a_game
    @user = User.find(params[:user_id])
    @game = Game.find(params[:game_id])
    permission_to_register!(@user, @game)
    @game.users << @user
    if @game.save!
      flash[:notice]=t 'game_registration_success'
      redirect_to game_path(@game.id)
    else
      flash[:warning]=t 'game_registration_failure'
      redirect_to game_path(@game.id)
    end

  end

  def unregister_from_a_game
    @user = User.find(params[:user_id])
    @game = Game.find(params[:game_id])
    permission_to_register!(@user, @game)
    @game.users.delete(@user)
    if @game.save!
      flash[:notice]="Не особо тебя и ждали..."
      redirect_to game_path(@game.id)
    else
      flash[:warning]=t 'game_unregistration_success'
      redirect_to game_path(@game.id)
    end
  end

  def permission_to_register!(user, game)
    unless user
      flash[:warning] = t 'no_such_user_id'
      redirect_to root_path
    end
    unless current_user && (user.id == current_user.id)
      flash[:warning] = t 'no_rights_to_register_user'
      redirect_to root_path
    end
  end

  def game_owner_validation!
    if current_user.nil? or current_user.id!=@game.creator
      flash[:warning]=t 'not_game_owner'
      redirect_to root_path
    end
  end

  def can_register?(game, user)
    if user.nil?
      return false
    end
    game.users.each do |u|
      if u.login==user.login
        return false
      end
    end
    if game.expired?
      return false
    end
    return true
  end

  def can_unregister?(game, user)
    if user.nil?
      return false
    end
    if game.expired?
      return false
    end
    game.users.each do |u|
      if u.login==user.login
        return true
      end
    end

    return false
  end

  helper_method :can_register?
  helper_method :can_unregister?

end
