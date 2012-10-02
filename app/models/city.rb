class City < ActiveRecord::Base
  attr_accessible :name

  def happiness_score
    50
  end
end
