require 'spec_helper'

describe CitiesController do
  context "when logged in" do

    describe "GET index" do
      it "should call City.by_happiness" do
        City.should_receive(:by_happiness)
        get :index
      end

      it "should assign @cities" do
        City.stub(:by_happiness){ ["abc"] }
        get :index
        assigns[:cities].should eq( ["abc"] )
      end
    end

  end
end
