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
    it "should return 50, all other things being equal" do
      Tweet.new.score_content_happiness.should eq(50)
    end

    it "should subtract 1 for a negative word" do
      Tweet.new(content: "Unhappy").score_content_happiness.should eq(50-1)
    end

    it "should subtract 1 for each negative word" do
      Tweet.new(content: "Unhappy that I am sad and brokenhearted.  Bummer.").score_content_happiness.should eq(50-4)
    end

  end
end
