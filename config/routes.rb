Rails.application.routes.draw do
  scope module: 'api/v1', path: 'api/v1', as: 'api_v1', except: [:new, :edit], defaults: { format: :json } do
    resources :blogs do
      resources :articles, only: [:index, :create], controller: 'blogs/articles'
    end

    resources :articles, only: [:show, :update, :destroy] do
      resources :comments, only: [:index, :create], controller: 'articles/comments'
    end

    resources :comments, only: [:show, :update, :destroy]

    resources :users, only: [] do
      resources :comments, only: [:index], controller: 'users/comments'
    end
  end
end
