class Tweet < ActiveRecord::Base
  attr_accessible :content, :happiness

  belongs_to :city

  before_create :set_happiness

  def set_happiness
    self.happiness ||= score_content_happiness
  end

  def score_content_happiness
    # TODO: some hardcore linguistic analysis
    50
  end

end
