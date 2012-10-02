class City < ActiveRecord::Base
  attr_accessible :name

  has_many :tweets

  def happiness_score
    50
  end
end
