Myrottenpotatoes::Application.routes.draw do
  # The root redirects to /movies
  root 'movies#index'

  # Create CRUD routes for /movies
  resources :movies

  # Route that posts ’Search TMDb’ form
  post '/movies/search_tmdb'
end
