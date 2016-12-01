Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/translate" => "translations#new", as: :translate 
  post  "/translate" => "translations#create"
  get "/history" => "translations#index"
  get "/translation" => "translations#show"
  resources :users, except: [:index, :new]
  get '/:locale/users/new', to: 'users#new', as: :new_user
  resources :user_sessions, only: [:create, :destroy]
  # resources :translations, except: [:edit, :update, :destroy]
  delete '/sign_out' => 'user_sessions#destroy', as: :sign_out
  get '/:locale/sign_in' ,to: 'user_sessions#new', as: :sign_in
  root "user_sessions#new"
end
