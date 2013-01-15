class Game < ActiveRecord::Base
  attr_accessible :date, :place, :price, :time
  has_and_belongs_to_many :users
  def to_s
    self.place.to_s+"("+
        self.date.to_s+", "+
        self.time_string+")"
  end
  def time_string
    self.time.hour.to_s+":"+self.time.min.to_s
  end
end
