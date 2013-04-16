GopisPriorities::Application.routes.draw do
  root :to => "checkins#new"
  match '/codecallback' => 'users#codecallback'

  resources :checkins
  resources :users
end
