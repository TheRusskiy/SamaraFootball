class Game < ActiveRecord::Base
  include ActionView::Helpers
  attr_accessible :date, :place, :price, :time, :creator
  has_and_belongs_to_many :users, :order => 'games_users.id'
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

  def creator_user(id)
    Game.find(id)
  end

  def expired?
    #!!(date<Date.today or (date==Date.today&&time<(Time.now.getutc+Time.now.utc_offset)))
    !!(date<Date.today or (date==Date.today&&time.hour<(Time.now.getutc+Time.now.utc_offset).hour))
  end

  def register_user(user)
    users << user
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
    debugger
    if self.expired?
      errors.add(:date, (t 'validations.past_time'))
    end
  end


end
