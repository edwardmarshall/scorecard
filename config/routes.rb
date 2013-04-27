Scorecard::Application.routes.draw do
  resources :points

  resources :antlers

  resources :users

  resources :animals

  get '/login' => 'sessions#new', as: :sign_in
  post '/login' => 'sessions#create', as: :sign_in
  post '/sign_up' => 'sessions#sign_up', as: :sign_up
  get '/logout' => 'sessions#destroy', as: :sign_out

  resources :scorecards do
    collection do
      get 'example'
    end
  end

  get '/home/' => 'animals#home', as: :home
  match '/auth/:provider/callback', to: 'sessions#oauth'

  root :to => 'sessions#new'
end
