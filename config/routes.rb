PushTheButton::Application.routes.draw do
  resources :messages, only: [:create]
  root :to => 'home#index'
end
