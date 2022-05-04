Rails.application.routes.draw do
  resources :candidates

  resources :companies do
    resources :works, only: [:create]
  end

  resources :works, except: [:create]
end
