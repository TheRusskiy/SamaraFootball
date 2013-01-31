# coding: utf-8
class GamesController < ApplicationController
  def index
    @games = Game.all
  end
  def new
    if current_user.nil?
      flash[:warning]="Чтобы организовывать матчи нужно войти под своим логином!"
      redirect_to login_form_path
    else
    #  render "NEW" template
      @game=Game.new
    end
   end

   def create
     @game = Game.new(params[:game])
     if @game.price<0
       flash[:warning]="Цена не может быть < 0, спустись на землю!"
       render new_game_path
       return
     end
     if @game.place=="" or @game.place.nil?
       flash[:warning]="Играть то где будем? Укажи место!"
       render new_game_path
       return
     end

     if @game.date<Date.today or (@game.date==Date.today&&@game.time<(Time.now.getutc+Time.now.utc_offset))
       flash[:warning]="Нельзя создать игру в прошлом!"
       render new_game_path
       return
     end

    if current_user.nil?
      flash[:warning]="Чтобы организовывать матчи нужно войти под своим логином!"
      redirect_to login_form_path
      return
    else
     @game[:creator]=current_user.id
    end


     if @game.save
       flash[:notice]=@game.to_s+" была создана!"
       redirect_to game_path(@game.id)
     else
       flash[:warning]=@game.errors.full_messages
       render new_game_path
     end

   end

   def show
     @game = Game.find(params[:id])
     @users=@game.users
   end


  def edit
     @game = Game.find(params[:id])
     if (current_user.nil? or current_user.id!=@game.creator)
       flash[:warning]="Только организатор может редактировать матч!"
       redirect_to root_path
       return
     end
   end

   def destroy
      @game=Game.find(params[:id])
      if (current_user.nil? or current_user.id!=@game.creator)
       flash[:warning]="Только организатор может отменить матч!"
       redirect_to root_path
       return
     end
      if @game.delete
        flash[:notice]=@game.to_s+" удалена!"
      else
        flash[:warning]=@game.errors.full_messages
     end
     redirect_to games_path
   end

   def update
     #Is password right?
     #This check is needed in order to prevent malicious calls from outside a browser
     user = User.authenticate(params[:user][:login],params[:user][:password])
     if user.nil?
       flash[:warning]="Неправильные логин/пароль, прекрати насиловать программу!"
       redirect_to root_path
     else
       @old_game = Game.find(params[:id])
       @game=Game.new(params[:game])
       @game.time=@game.time.change(:year => Time.now.year, :month => Time.now.month, :day => Time.now.day)

        #VALIDATIONS:
        if @game.price<0
          flash[:warning]="Цена не может быть < 0, спустись на землю!"
          redirect_to edit_game_path(params[:id])
          return
        end
        if @game.place=="" or @game.place.nil?
          flash[:warning]="Играть то где будем? Укажи место!"
          redirect_to edit_game_path(params[:id])
          return
        end

        if @game.date<Date.today or (@game.date==Date.today&&@game.time<(Time.now.getutc+Time.now.utc_offset))
          flash[:warning]="Нельзя создать игру в прошлом!"
          redirect_to edit_game_path(params[:id])
          return
        end


       if @old_game.update_attributes(params[:game])
         flash[:notice]=@game.to_s+" была отредактирована!"
         redirect_to game_path(@old_game.id)
       else
         flash[:warning]=@game.errors.full_messages
         redirect_to edit_game_path(@old_game.id)
       end
     end
   end

  def register_for_a_game
    @user = User.find(params[:user_id])
    user = User.authenticate(params[:user][:login],params[:user][:password])
        if user.nil? or user.id != @user.id
          flash[:warning]="Неправильные логин/пароль, прекрати насиловать программу!"
          redirect_to root_path
        else

        @game = Game.find(params[:game_id])

        if not can_register?(@game, @user)
          flash[:warning]="Вы не можете зарегистрировать другого другого игрока"
          redirect_to root_path
          return
        end

        @game.users << @user
        if @game.save!
          flash[:notice]="Приходи, ждём!"
          redirect_to game_path(@game.id)
        else
          flash[:warning]="Ошибко О_о!"
          redirect_to game_path(@game.id)
        end

        end
  end

  def unregister_from_a_game
    @user = User.find(params[:user_id])
    user = User.authenticate(params[:user][:login],params[:user][:password])
        if user.nil? or user.id != @user.id
          flash[:warning]="Неправильные логин/пароль, прекрати насиловать программу!"
          redirect_to root_path
        else

        @game = Game.find(params[:game_id])
        if not can_unregister?(@game, @user)
          flash[:warning]="Вы не можете зарегистрировать другого другого игрока"
          redirect_to root_path
          return
        end

        @game.users.delete(@user)
        if @game.save!
          flash[:notice]="Не особо тебя и ждали..."
          redirect_to game_path(@game.id)
        else
          flash[:warning]="Ошибко О_о"
          redirect_to game_path(@game.id)
        end

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

    return true
  end

  def can_unregister?(game, user)
    if user.nil?
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
