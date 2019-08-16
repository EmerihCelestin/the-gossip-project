Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :gossips do
  resources :comment, :like
  end
  resources :accueil, only: [:index]
  root 'accueil#index'
	resources :profil
  resources	:city
  # get 'profil/:id', to:'profil#show' 
  # get 'potin/:id', to: 'potin#show'
  get 'welcome/:first_name', to: 'welcome#show'
  get 'contact/show'
  get 'team/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
