Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :subs do
    resources :posts, only: [:new, :create]
  end
  resources :posts, except: [:new, :create, :index] do
    resources :comments, only: [:new]
  end

  resources :comments, only: [:create, :show]
end
