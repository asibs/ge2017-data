Rails.application.routes.draw do

  root 'constituencies#index'

  get 'constituencies', to: 'constituencies#index'
  get 'constituencies/:id', to: 'constituencies#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
