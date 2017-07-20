Rails.application.routes.draw do
  # get 'friendships/create'

  # get 'friendships/update'

  # get 'friendships/destroy'
  
    resources :friendships, only: [:create, :update, :destroy]

  #resources :users
  resources :posts
  #devise_for :users
  get 'home/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
#resources :posts do
   #resources :votes
   #end
resources :posts do
    resources :endorsements

end
resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: [:create]
end

resources :posts do
  resources :comments
end


   resources :post do
    member do
    put "like", to: "posts#upvote"
    put "dislike", to: "posts#downvote"
  end

  end
resources :users do
  resources :follows

end
get "/tagging" => "posts#tag"
get "user/profile" => "users#show"
get "user/follow" => "users#follow"
#get "user/unfollow" => "users#unfollow"
get "user/following" => "follows#following"
get "user/follower" => "follows#follower"
end
