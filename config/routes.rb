Rails.application.routes.draw do
  root 'destinations#index'
  resources :destinations

end
