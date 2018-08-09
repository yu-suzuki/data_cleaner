Rails.application.routes.draw do
  resources :options
  resources :data_clean_tasks
  root 'home#index'
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
