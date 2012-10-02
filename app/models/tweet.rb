class Tweet < ActiveRecord::Base

  NEGATIVES = %w(unhappy sad bummer brokenhearted)
  POSITIVES = %w(awesome great beautiful stoked)

  attr_accessible :content, :happiness

  belongs_to :city

  before_create :set_happiness

  def set_happiness
    self.happiness ||= score_content_happiness
  end

  def score_content_happiness
    # TODO: some hardcore linguistic analysis
    50 - negatives + positives
  end

  private

  def negatives
    ret = 0
    content.to_s.downcase.split(/\b/).each do |word|
      ret += 1 if NEGATIVES.include?(word)
    end
    ret > 50 ? 50 : ret
  end

  def positives
    ret = 0
    content.to_s.downcase.split(/\b/).each do |word|
      ret += 1 if POSITIVES.include?(word)
    end
    ret > 50 ? 50 : ret
  end

end
