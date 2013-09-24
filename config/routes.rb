Whitespace::Application.routes.draw do

  devise_for :users, :path_names => { :sign_in => 'login',
                                      :sign_out => 'logout',
                                      :sign_up => 'signup'}

  resources :users do
    resources :comments
    resources :ideas
    resources :resources
  end

  resources :projects do
    resources :phases do
      resources :comments
      resources :resources
      resources :ideas do
        resources :comments
        member do
          post :vote_up
          post :vote_down
        end
        resources :comments
      end
    end
    resources :comments
  end

  resources :ideas do
    resources :comments
    member do
      post :vote_up
      post :vote_down
    end
  end

  resources :comments do
    member do
      post :vote_up
      post :vote_down
    end
  end

  resources :resources do
    member do
      post :vote_up
      post :vote_down
    end
  end

  match 'about', :to => 'pages#about'
  match 'contact', :to => 'pages#contact'
  match 'help', :to => 'pages#help'
  match 'problem', :to => 'pages#problem'

  root :to => 'pages#index'

  match '*path' => redirect('/')

end
