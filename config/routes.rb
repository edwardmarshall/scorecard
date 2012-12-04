Scorecard::Application.routes.draw do

	root :to => 'scorecards#index'

	resources :points

	resources :antlers

	resources :users

	resources :animals

	get '/login' => 'sessions#new', as: :sign_in
	post '/sessions' => 'sessions#create' 
	get '/logout' => 'sessions#destroy', as: :sign_out

	get '/scorecards' => 'animals#scorecards', as: :scorecards
	get '/scorecards/:id' => 'animal#scorecard', as: :scorecard
  
end