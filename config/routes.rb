PrepSite::Application.routes.draw do
  get "select_user", to: "home#select_user"
  
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' }

  resources :users
  resources :preps do
    resources :prep_applications do
      get "decline"
      get "confirmed"
      get "withdraw"
    end

  end

  resources :contracts do
    collection do
      post 'invite'
    end
  end

  resources :preppee do
    collection do
      get 'open_request'
      get 'scheduled'
    end
  end

  resources :prepper do
    collection do
      get 'open_request'
      get 'confirmed'
      get 'scheduled'
    end
  end
  
  resources :admin do
    collection do
      get 'open_request'
      get 'pricing_management'
      get 'session_recordings'
      get 'accounting'
      get 'settings'
    end
  end

  resources :job_types
  resources :skill_tags
  resources :products
  resources :profiles do
    collection do
      get 'payment'
    end
  end

  resources :other_experiences, only: [:create, :destroy]
  resources :skills, only: [:create, :destroy]
  resources :pro_experiences, only: [:create, :destroy]
  resources :educations, only: [:create, :destroy]
end