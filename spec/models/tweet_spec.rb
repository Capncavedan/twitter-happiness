require 'spec_helper'

describe Tweet do

  it "should set happiness score when instantiated without one" do
    tweet = Tweet.new(content: 'Whoops! Broke my leg!')
    tweet.should_receive(:score_content_happiness)
    tweet.run_callbacks(:create)
  end

  it "should not set happiness score when instantiated with a score" do
    tweet = Tweet.new(content: 'Driving', happiness: 50)
    tweet.should_not_receive(:score_content_happiness)
    tweet.run_callbacks(:create)
  end

  describe "#score_content_happiness" do
  end
end
