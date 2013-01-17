require "./spec/fast/active_record_spec_helper"

require "./lib/user_extensions"

require "./app/models/user"

describe User do
	user = User.new(:first_name => "Dmitry", :last_name =>"Ishkov")

	it "saves user to database" do
    user.save
    user_from_db = User.find_by_first_name_and_last_name("Dmitry", "Ishkov")
    user_from_db.should eq(user)
  	end

  	it "shows full name" do
  	user.full_name.should eq("Dmitry Ishkov")
  	end
	
end