require "./lib/user_extensions"

class UserForSpec
	include UserExtensions
end

describe UserExtensions do

   subject { UserForSpec.new }
  
  it "shows the person's full name" do
    subject.stub(:first_name) { "First" }
    subject.stub(:last_name) { "Last" }
    subject.full_name.should == "First Last"
  end
end