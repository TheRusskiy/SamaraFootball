class Game < ActiveRecord::Base
  attr_accessible :date, :place, :price, :time
end
