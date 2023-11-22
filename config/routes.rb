Rails.application.routes.draw do
resources :movies, only: [:index, :show] do
    collection do
      get :search
      post :add_to_favorite
      post :remove_from_favorite
      get :favorites
    end
  end

  root 'movies#index'
end
