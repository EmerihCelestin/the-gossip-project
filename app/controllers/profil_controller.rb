class ProfilController < ApplicationController
  before_action :authenticate_user, except: [:new, :create] 
  def index
	end
	
	def show
		@user = User.find(params["id"])
  	@city = @user.city
	end
	
	def new
		@cities = City.all
	end
	
	def create
		@cities = City.all
		first_name = params['first_name']
		last_name = params['last_name']
		description = params['description']
		email = params['email']
		age = params['age']

		city_id = params['city_id']
		password = params['password']
		password_confirmation = params['password_confirmation']
		@user = User.new(first_name: first_name, last_name: last_name, description: description, email: email,age: age, city_id: city_id, password: password, password_confirmation: password_confirmation   )
		if @user.password == @user.password_confirmation
			if @user.save
					log_in(@user)
					flash.now[:sucess] = "Profil create"
					redirect_to gossips_path
			else
					render 'new'
			end
		else
			flash.now[:danger] = "Invalid password comfirmation" 
			render 'new'
		end			
	end			
	
	
	def edit
	end
	
	def update
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
	