Rails.application.routes.draw do

  root 'static_pages#reports'

  controller :static_pages do
    get :reports
    get :about
  end

  resources 'constituencies', only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
