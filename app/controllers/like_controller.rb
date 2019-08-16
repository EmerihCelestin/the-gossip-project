class LikeController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create

     @gossip = Gossip.find(params[:gossip_id])
     @like = Like.new
     @like.gossip = @gossip
     @like.user = User.find_by(id: session[:user_id])
     
     if @like.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      redirect_back(fallback_location: root_path)
     end

  end

  def edite
  end

  def update
  end

  def destroy
    gossip = Gossip.find(params[:gossip_id])
    @like = Like.find_by(gossip_id: gossip.id , user_id: session[:user_id])
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
