class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :date
      t.string :place
      t.integer :price
      t.time :time

      t.timestamps
    end
  end
end
