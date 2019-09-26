Rails.application.routes.draw do
  root 'services#index'
  resources :services

  get 'health' => 'services#health'
  get 'find' => 'services#find'
  get 'bind' => 'services#bind'
  get 'renew' => 'services#renew'
  post 'register' => 'services#register'
  post 'unregister' => 'services#unregister'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
