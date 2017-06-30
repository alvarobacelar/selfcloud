Rails.application.routes.draw do
  resources :servers
  resources :clouds
  devise_for :usuarios
  root to: 'welcome#index'
  get 'choose_cloud' => 'clouds#choose_cloud'
  get 'welcome/index'
  get 'clouds/rebootLinode' => 'clouds#rebootLinode'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
