class AddLocaleToProfile < ActiveRecord::Migration
  def self.up
    add_column :profiles, :language, :string
  end

  def self.down
    delete_column :profiles, :language
  end
end
