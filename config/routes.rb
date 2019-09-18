Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :boards do
    resources :things, only: [:new, :create]
  end

  get "about", to: "homepage#about"
  root to: "homepage#index"
end
