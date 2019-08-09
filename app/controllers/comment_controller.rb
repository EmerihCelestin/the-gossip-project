class CommentController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

 def create
    id = params['id'] 
    content = params['content']
    @comment = Comment.new(content: content,gossip_id: id, user_id: 11) # avec xxx qui sont les données obtenues à partir du formulaire

    if @comment.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      redirect_to gossips_path, :notice => "The super potin was succesfully saved !"

    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render'new'
    end
    

  def edit
  end

  def update
  end

  def destroy
  end
end
