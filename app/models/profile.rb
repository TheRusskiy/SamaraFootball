class Profile < ActiveRecord::Base
  attr_accessible :birth_date, :first_name, :last_name, :position, :sex
  belongs_to :user
end
