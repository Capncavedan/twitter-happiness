class CitiesController < ApplicationController

  def index
    @cities = City.by_happiness
  end

end