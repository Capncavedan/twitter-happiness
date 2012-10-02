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
      tweet = Tweet.new
      tweet.score_content_happiness.should eq(50)
    end

    context "negativity" do
      it "should subtract 1 for a negative word" do
        tweet = Tweet.new(content: "Unhappy")
        tweet.score_content_happiness.should eq(50-1)
      end

      it "should subtract 1 for each negative word" do
        tweet = Tweet.new(content: "Unhappy that I am sad and brokenhearted.  Bummer.")
        tweet.score_content_happiness.should eq(50-4)
      end

      it "should not subtract more than 50" do
        tweet = Tweet.new(content: "Unhappy "*51)
        tweet.score_content_happiness.should eq(0)
      end
    end

    context "positivity" do
      it "should add 1 for a positive word" do
        tweet = Tweet.new(content: "Awesome!")
        tweet.score_content_happiness.should eq(50+1)
      end

      it "should add 1 for each positive word" do
        tweet = Tweet.new(content: "Stoked that my awesome beautiful wife had a great time kayaking in the Atlantic")
        tweet.score_content_happiness.should eq(50+4)
      end

      it "should not add more than 50" do
        tweet = Tweet.new(content: "Awesome! "*51)
        tweet.score_content_happiness.should eq(100)
      end
    end

    context "mixed negative and positive" do
      it "should add and subtract a mix of words" do
        tweet = Tweet.new(content: "Awesome sad bummer, my beautiful brokenhearted")
        tweet.score_content_happiness.should eq(50+2-3)
      end
    end
  end
end
