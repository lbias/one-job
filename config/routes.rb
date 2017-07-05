Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  namespace :admin do
    resources :jobs do
      member do
        post :publish
        post :hide
      end
      resources :resumes
    end

    resources :locations
  end

  resources :jobs  do
    resources :resumes
    member do
      post :add
      post :remove
    end
  end

  namespace :account do
    resources :resumes
    resources :collections
  end
end
