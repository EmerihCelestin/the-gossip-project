class GossipsController < ApplicationController
  def index
    @all_users= User.all
    @all_gossips= Gossip.all
  end

  def show
    @gossip = Gossip.find(params['id'])
    @user = @gossip.user
  end

  def new
  end

  def create
    title = params['title']
    content = params['content']
    anonymous = User.create(first_name: "anonymous", description: "anonymous", email: "anonymous", age: 00, city_id: 8)
    u_id = anonymous.id 
    @gossip = Gossip.new(title: title,content: content, user_id: u_id) # avec xxx qui sont les données obtenues à partir du formulaire

  if @gossip.save # essaie de sauvegarder en base @gossip
    # si ça marche, il redirige vers la page d'index du site
    redirect_to gossips_path, :notice => "The super potin was succesfully saved !"

  else
    # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    render'new'
  end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
