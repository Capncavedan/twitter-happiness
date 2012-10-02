class City < ActiveRecord::Base
  attr_accessible :name

  has_many :tweets

  def happiness
    tweets.empty? ? nil : tweets.average(:happiness)
  end
end
