Rails.application.routes.draw do
  root to: "feeds#index"
  get '/my_photos', to: 'photos#my_photos', as: 'my_photos'
  get '/my_albums', to: 'albums#my_albums', as: 'my_albums'

  resources :albums
  resources :photos
  devise_for :users
  resources :users do
    resources :photos, only: :index
    resources :albums, only: :index
  end
end
