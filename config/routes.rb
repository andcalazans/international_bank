Rails.application.routes.draw do
  root to: 'banks#index'
  resources :banks do
    get :change, on: :collection
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
