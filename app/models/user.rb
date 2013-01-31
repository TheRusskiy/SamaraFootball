require "./lib/user_extensions.rb"
class User < ActiveRecord::Base	
  attr_accessible :first_name, :last_name, :login, :password
  has_and_belongs_to_many :games
  public
  
  def self.authenticate(login, password)
     User.find_by_login_and_password(login, password)
  end

  	def full_name
	  	self.first_name+" "+self.last_name
	end  
end
