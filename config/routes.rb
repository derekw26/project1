Rails.application.routes.draw do

  root :to => 'session#new'
  get '/home'=> 'pages#home'
  get '/token' => 'workouts#get_token'

  resources :users, :only => [:index, :new, :create]
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/running' => 'pages#running'
  get '/schedule' => 'pages#schedule'

  post '/workouts/:workout_id/rounds/new' => 'rounds#new'
  post '/workouts/:workout_id/rounds/:id/edit' => 'rounds#edit'

  resources :workouts do
    resources :rounds, :except => [:index, :show]
  end

end
