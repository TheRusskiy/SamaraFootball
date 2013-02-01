
module MyActiveRecordExtensions
  extend ActiveSupport::Concern

  # add your instance methods here


  # add your static(class) methods here
  module ClassMethods

  end

end

# include the extension
ActiveRecord::Base.send(:include, MyActiveRecordExtensions)

