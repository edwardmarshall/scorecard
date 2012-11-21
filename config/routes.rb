Scorecard::Application.routes.draw do

  resources :points

  resources :antlers

  resources :users
  resources :animals
  
  root :to => 'Mockup#scorecard'
  get '/mockup/scorecard' => 'Mockup#scorecard'
  
end
