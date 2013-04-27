Scorecard::Application.routes.draw do
  resources :points

  resources :antlers

  resources :users

  resources :animals

  post '/login' => 'sessions#create', as: :sign_in
  post '/sign_up' => 'sessions#sign_up', as: :sign_up
  get '/logout' => 'sessions#destroy', as: :sign_out

  resources :scorecards do
    collection do
      get 'example'
    end
  end

  get '/home/' => 'animals#home', as: :home

  root :to => 'sessions#new'
end
