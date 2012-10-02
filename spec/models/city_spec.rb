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

  it "should know its happiness score" do
    city = City.new
    city.happiness_score.should be_a(Integer)
  end
end
