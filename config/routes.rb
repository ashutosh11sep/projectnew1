Rails.application.routes.draw do
  resources :posts
  #devise_for :users
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
#resources :posts do
   #resources :votes
   #end

   resources :post do
    member do
    put "like", to: "posts#upvote"
    put "dislike", to: "posts#downvote"
  end
end
end
