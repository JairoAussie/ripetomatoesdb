Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/movies", to: "movies#index"
  get "/movies/new", to: "movies#new", as: "new_movie"
  get "/movies/:id", to: "movies#show", as: 'movie'
  get "/movies/:movie_id/reviews", to: 'reviews#index', as: 'movie_reviews'
  get "/movies/:movie_id/reviews/new", to: 'reviews#new', as: 'new_movie_review'
  post '/movies/:movie_id/reviews', to: 'reviews#create'
  post "/movies", to: "movies#create"
  # resources :movies do
  #   resources :reviews
  # end
  get "/actors", to: "actors#index"

end
