Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  scope :api do
    get 'projects/user_projects'
    get '/favorited', to: 'favorites#favorited'
    resources :projects
    resource :favorite_projects, to: 'favorites#create', only: :create
    resource :favorite_projects, to: 'favorites#destroy', only: :destroy
    resources :user_favorites, to: 'favorites#index', only: :index
  end
end
