Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/translate" => "control#index" 
  post  "/translate" => "control#translate"
  get "/history" => "control#history"
  resources :users, except: [:index]
  resources :user_sessions, only: [:create, :destroy]
  delete '/sign_out' => 'user_sessions#destroy', as: :sign_out
  get '/sign_in' => 'user_sessions#new', as: :sign_in
  root "user_sessions#new"
end
