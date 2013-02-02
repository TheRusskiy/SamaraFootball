class Profile < ActiveRecord::Base
  include ActionView::Helpers
  attr_accessible :birth_date, :first_name, :last_name, :position, :sex, :language
  belongs_to :user
end
