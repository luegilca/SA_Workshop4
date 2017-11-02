Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :sales
  resources :users
  resources :products
  wash_out :buyws
  wash_out :webservice

end
