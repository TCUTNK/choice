Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dinners#index'
  resources :dinners, param: :slug do
  	resources :votes
  end
  get '/share_dinner' => 'urls#index'
  resources :histories, only: [:index,:show], param: :slug

end
