Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root :to => 'questions#index'


  resources :profiles, param: :username, :only => :show

  resources :questions do
    resources :comments, :except => [:show, :index]
  end

  resources :comments do
    post 'upvote'
  end
end
