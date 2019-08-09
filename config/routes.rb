Rails.application.routes.draw do
	resources :gossips
	resources :profil
  resources	:city
  # get 'profil/:id', to:'profil#show' 
  # get 'potin/:id', to: 'potin#show'
  get 'welcome/:first_name', to: 'welcome#show'
  get 'contact/show'
  get 'team/show'
  get '/', to: 'accueil#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
