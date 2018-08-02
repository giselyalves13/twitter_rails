Rails.application.routes.draw do
  get 'sessions/new'
  resources :users
  get    'sign_in'   => 'sessions#new'
  post   'sign_in'   => 'sessions#create'
  delete 'sign_out'  => 'sessions#destroy'
  resources :tweets
  get 'twitter/index'
  root 'tweets#index'
  get 'user_tweets' => 'users#tweets'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
