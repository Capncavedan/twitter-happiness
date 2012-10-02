require 'spec_helper'

describe "/cities/index" do

  it "should render" do
    @cities = []
    render
  end

  it "should display a city name" do
    city1 = stub_model(City, name: 'City One', happiness: 55)
    @cities = [city1]
    render
    rendered.should =~ /City One \(score: 55\)/
  end

end