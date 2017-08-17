Rails.application.routes.draw do
  get 'install/puppet'

  resources :servers  do
  	get 'install_puppet', on: :member
    get 'start_server', on: :member
  end
  
  resources :clouds
  devise_for :usuarios
  root to: 'welcome#index'
  get 'choose_cloud' => 'clouds#choose_cloud'
  get 'welcome/index'
  get 'clouds/rebootLinode' => 'clouds#rebootLinode'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
