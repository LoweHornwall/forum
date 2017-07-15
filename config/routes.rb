Rails.application.routes.draw do
  get 'home/index'

  root 'home#index'

  resources :users
  resources :forum_threads, param: :name 

  get '/forum_threads/:name/:page_num' => 'thread_pages#show', :as => 'thread_page'

  post '/forum_threads/:name/:page_num/post' => 'posts#create', :as => 'create_post'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/forum/:name/:forum_page_num' => 'forums#show', :as => 'forum_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
