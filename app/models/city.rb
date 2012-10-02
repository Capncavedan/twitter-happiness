class City < ActiveRecord::Base
  attr_accessible :name

  has_many :tweets

  def happiness
    tweets.average(:happiness).to_i
  end

  def self.by_happiness
    joins(:tweets).order("tweets.happiness DESC")
  end

end
