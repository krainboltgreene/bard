Bard::Application.routes.draw do

  resources :sessions
  resources :accounts do
    get 'dashboard', action: :dashboard, on: :collection
  end

  get "signin", controller: :sessions, action: :new, as: :signin
  get "signout", controller: :sessions, action: :destroy, as: :signout

  get "about", controller: :pages, action: :about, as: :about
  get "jobs", controller: :pages, action: :jobs, as: :jobs
  get "terms", controller: :pages, action: :terms, as: :terms
  get "policy", controller: :pages, action: :policy, as: :policy
  get "splash", controller: :pages, action: :splash, as: :splash
  get "beta", controller: :pages, action: :beta, as: :beta

  root to: "pages#splash"
end
