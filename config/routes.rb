Whitespace::Application.routes.draw do

  devise_for :users
  resources :users do
    resources :comments
    resources :proposals
    resources :resources
  end

  resources :projects do
    resources :phases do
      resources :comments
      resources :resources
      resources :proposals do
        resources :comments
      end
    end
    resources :comments
  end

  match 'about', :to => 'pages#about'
  match 'contact', :to => 'pages#contact'
  match 'help', :to => 'pages#help'
  match 'problem', :to => 'pages#problem'

  root :to => 'pages#index'

  match '*path' => redirect('/')

end
