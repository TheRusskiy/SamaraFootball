class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :position
      t.string :sex
      t.date :birth_date
      t.references :user

      t.timestamps
    end

    User.all.each do |u|
      new_profile = Profile.new
      new_profile.first_name=u.first_name
      new_profile.last_name=u.last_name
      new_profile.position=u.position
      new_profile.save
      u.profile=new_profile
    end
  end

  def self.down
    drop_table :profiles
  end
end
