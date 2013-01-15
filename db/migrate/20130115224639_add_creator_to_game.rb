class AddCreatorToGame < ActiveRecord::Migration
  def change
    add_column :games, :creator, :integer
  end
end
