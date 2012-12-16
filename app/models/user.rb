class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :login, :password
  public
  def self.authenticate(login, password)
     User.find_by_login_and_password(login, password)
  end
end
