Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root "control#index"
	post  "/" => "control#translate"
  get "/history" => "control#history"
end
