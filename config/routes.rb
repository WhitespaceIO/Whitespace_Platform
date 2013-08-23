Whitespace::Application.routes.draw do

  devise_for :users
  resources :users

  resources :proposals
  resources :comments

  resources :phases do
    resources :comments
  end

  resources :projects do
    resources :phases do
      resources :comments
    end
    resources :comments
  end

  root :to => 'projects#index'

  match '*path' => redirect('/')

end
