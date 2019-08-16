class AccueilController < ApplicationController
  def index
  	@all_users= User.all
  	@all_gossips= Gossip.all

  end
end
