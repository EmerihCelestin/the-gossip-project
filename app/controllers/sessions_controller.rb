class SessionsController < ApplicationController
  def new
  end

  def create
    email = params['email']
    password = params['password']
    user = User.find_by(email: email)

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(password)
      log_in(user)
      flash.now[:sucess] = "Connexion réussit!"
      redirect_to gossips_path 
      # redirige où tu veux, avec un flash ou pas

    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
     session.delete(:user_id)
     redirect_to accueil_index_path
  end
end
