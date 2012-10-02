require 'spec_helper'

describe City do
  it "should be able to be instantiated" do
    city = City.new
    city.should be_a(City)
  end

  it "should take a name" do
    city = City.new(name: "Indianapolis")
    city.name.should eq("Indianapolis")
  end

  it "should have associated tweets" do
    City.new.tweets.should eq([])
  end

  describe "happiness score" do
    it "should average score of associated tweets" do
      city = FactoryGirl.create(:city)
      tweet = FactoryGirl.create(:tweet, city: city)
      city.happiness.should eq(50)
    end
  end
end
