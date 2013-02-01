module GamesHelper
  def register_for_a_game_path(game_id, user_id)
    "#{game_id}/register/#{user_id}"
  end

  def unregister_from_a_game_path(game_id, user_id)
      "#{game_id}/register/#{user_id}"
  end

  def game_expiration_class(game)
    class_string=""
    if game.expired?
      class_string="error"
    else
      class_string="success"
    end

  end

end
