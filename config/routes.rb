GopisPriorities::Application.routes.draw do
  root :to => "checkins#new"
  match '/codecallback' => 'users#codecallback'
  match 'logout'        => 'users#logout'

  resources :checkins
  resources :users
end
