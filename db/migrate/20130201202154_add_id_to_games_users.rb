class AddIdToGamesUsers < ActiveRecord::Migration
  def self.up
    add_column :games_users, :id, :primary_key
  end

  def self.down
    remove_column :games_users, :id
  end
end
