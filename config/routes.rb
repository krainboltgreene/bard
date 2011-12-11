Bard::Application.routes.draw do

  resources :features do
    get 'dashboard', action: :dashboard, on: :collection
  end

  resources :sessions
  resources :accounts

  get "signin", controller: :sessions, action: :new, as: :signin
  get "signout", controller: :sessions, action: :destroy, as: :signout
  get "signup", controller: :accounts, action: :new, as: :signup

  get "about", controller: :pages, action: :about, as: :about
  get "jobs", controller: :pages, action: :jobs, as: :jobs
  get "terms", controller: :pages, action: :terms, as: :terms
  get "support", controller: :pages, action: :support, as: :support
  get "policy", controller: :pages, action: :policy, as: :policy
  get "splash", controller: :pages, action: :splash, as: :splash
  get "beta", controller: :pages, action: :beta, as: :beta

  root to: "pages#splash"
end
