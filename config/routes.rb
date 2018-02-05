Rails.application.routes.draw do
	root"users#index"
	resources :users

	root"pages#index"
		get "page-top-secrete", to: "pages#index"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
