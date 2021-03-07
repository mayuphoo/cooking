Rails.application.routes.draw do
  devise_for :users
  

  get '/articles/genre/:id', to: "articles#genre"
  resources :mypages, only: :show  
  resources :articles do
    resource :like, only: [:create, :destroy]
  end
  root "articles#index"

end


