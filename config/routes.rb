Rails.application.routes.draw do
  resources :items, only: [:index]

  # return an array of all items belong to a user:
  resources :users, only: [:show] do 
    resources :items, only: [:index, :show, :create]
  end

end
