PushTheButton::Application.routes.draw do
  resources :messages, only: [:create, :new]
  root :to => 'home#index'
end
