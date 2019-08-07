class AccueilController < ApplicationController
  def show
  	@all_users= User.all
  	@all_gossips= Gossip.all

  end
end
