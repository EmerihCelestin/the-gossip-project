class CityController < ApplicationController
  def index
  end

  def show
    @city = City.find(params["id"])
    @user = @city.users
    @gossips = []
    @user.each do |user| 
    @gossips << user.gossips 
    end
    
  end

  def new
  end

  def create
  end

  def edit
  end

  def uptdate
  end

  def destroy
  end
end
