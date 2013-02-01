module ApplicationHelper
  class ActiveRecord::Base
    def error_report
      errors=""
      self.errors.values.each do |err|
        errors+=err.to_s+". \n"
      end
      errors.to_s.gsub(/(\[")|("\])/, "")
    end
  end
end
