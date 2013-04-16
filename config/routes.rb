GopisPriorities::Application.routes.draw do
  root :to => "checkins#new"
  match '/codecallback' => 'users#codecallback'
  match '/tokencallback' => 'users#tokencallback'

  resources :checkins
  resources :users
end
