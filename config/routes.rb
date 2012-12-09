Scorecard::Application.routes.draw do

	root :to => 'animals#home'

	resources :points

	resources :antlers

	resources :users

	resources :animals

	get '/login' => 'sessions#new', as: :sign_in
	post '/sessions' => 'sessions#create' 
	get '/logout' => 'sessions#destroy', as: :sign_out

	get '/scorecards' => 'animals#scorecards', as: :scorecards
	get '/scorecards/:id' => 'animals#scorecard', as: :scorecard
	get '/scorecards/:id/edit' => 'animals#scoresheet', as: :scoresheet

	get '/home/' => 'animals#home', as: :home
  
end