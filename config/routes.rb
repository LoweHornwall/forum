Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  resources :users

  get '/forums/:name/new' => 'forum_threads#new', :as => 'new_forum_thread'
  post '/forums/:name/' => 'forum_threads#create', :as => 'create_thread'
  resources :forum_threads, param: :name, :except => :new, :except => :create

  get '/forum_threads/:name/:page_num' => 'thread_pages#show', :as => 'thread_page'

  post '/forum_threads/:name/:page_num/post' => 'posts#create', :as => 'create_post'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/forums' => 'forums#index'
  get '/forums/:name/:forum_page_num' => 'forums#show', :as => 'forum_page'
  get '/forums/new' => 'forums#new'
  post '/forums/' => 'forums#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
