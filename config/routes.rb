Rails.application.routes.draw do

  root :to => 'pages#home'

  resources :users, :only => [:index, :new, :create]
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/cardio' => 'workouts#cardio'
  get '/schedule' => 'workouts#schedule'

  post '/workouts/:workout_id/rounds/new' => 'rounds#new'

  resources :workouts do
    resources :rounds, :except => [:index, :show]
  end

end
