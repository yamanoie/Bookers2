Rails.application.routes.draw do
	devise_for :users
	resources :books do
		resources :book_comments, only: [:create, :destroy]
		resource :favorites, only: [:create, :destroy]
	end
	root "homes#top"

  resources :users
  get "home/about" => "homes#about", as: "top_about"
  # Fo details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
