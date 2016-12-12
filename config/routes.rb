Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/movies' => 'movies#index'
  get '/movies/new' => 'movies#new'
  get '/movies/:id' => 'movies#show'
  get '/movies/:id/edit' => 'movies#edit'
  patch 'movies/:id' => 'movies#update'
  post '/movies' => 'movies#create'
  delete '/movies/:id' => 'movies#destroy'
end
