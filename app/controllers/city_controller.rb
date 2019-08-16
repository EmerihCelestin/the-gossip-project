class CityController < ApplicationController
  before_action :authenticate_user
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
  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
