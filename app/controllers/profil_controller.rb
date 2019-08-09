class ProfilController < ApplicationController
  def show
  	@user = User.find(params["id"])
  	@city = @user.city
  end
end
