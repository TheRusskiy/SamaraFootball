class Game < ActiveRecord::Base
  include ActionView::Helpers
  attr_accessible :date, :place, :price, :time, :creator
  has_and_belongs_to_many :users
  validate :price_validation
  validate :date_validation
  validate :place_validation
  def to_s
    self.place.to_s+"("+
        self.date.to_s+", "+
        self.time_string+")"
  end
  def time_string
    self.time.hour.to_s+":"+self.time.min.to_s
  end

  def expired?
    !!(date<Date.today or (date==Date.today&&time<(Time.now.getutc+Time.now.utc_offset)))
  end

  private
  def price_validation
     if self.price<0
       errors.add(:price, (t 'validations.price_below_zero'))
     end
  end

  def place_validation
    if self.place == ""
      errors.add(:place, (t 'validations.no_place'))
    end
  end

  def date_validation
    if expired?
      errors.add(:date, (t 'validations.past_time'))
    end
  end


end
