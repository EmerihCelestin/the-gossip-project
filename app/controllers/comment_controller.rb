class CommentController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

 def create
    id = params[:gossip_id]
    @gossip = Gossip.find(id)
    
    anonyme = User.find(11)

    content = params[:content]

    @comment = Comment.new(content: content)
    @comment.user = anonyme
    @comment.gossip = @gossip
    @user = @gossip.user
    @city = @user.city 

    if @comment.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      redirect_to @gossip, :notice => "New comment!"

    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      render 'gossips/show'
    end
  end 

  def edit
    @comment = Comment.find(params['id'])
  end

  def update
    @comment = Comment.find(params[:id])
    @gossip = @comment.gossip
    content = params['content']
    if @comment.update(content: content)
      redirect_to @gossip, :alert => "Comment was succesfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @gossip = @comment.gossip
    @comment.destroy
    redirect_to @gossip, :notice => "Comment Removed"
  end
end
