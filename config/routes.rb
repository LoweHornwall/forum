Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  resources :users
  resources :forum_threads, param: :name 

  get '/forum_threads/:name/:page_num' => 'thread_pages#show', :as => 'thread_page'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
