Rails.application.routes.draw do

  get 'backoffice', to: 'backoffice/home#index'
  get 'admin', to: 'backoffice/home#index'
  
  namespace :backoffice do
    resources :admins, except: [:show]
    resources :questions, except: [:show]
    resources :projects, except: [:show]
    resources :works, except: [:show]
    resources :flags, except: [:show]
    resources :services, except: [:show]
    resources :professionals, except: [:show, :index, :new]
    resources :health_insurances, except: [:show]
    resources :categories#, except: [:show]
    resources :posts#, except: [:show]
    resources :diaries, except: [:show]
    resources :settings, except: [:show]
    get 'admin', to: 'home#index'
    get 'admins', to: 'admins#index'
    get 'questions', to: 'questions#index'
    get 'projects', to: 'projects#index'
    get 'works', to: 'works#index'
    get 'flags', to: 'flags#index'
    get 'services', to: 'services#index'
    #get 'professionals', to: 'professionals#edit'
    get 'health_insurances', to: 'health_insurances#index'
    get 'categories', to: 'categories#index'
    get 'diaries', to: 'diaries#index'
    get 'settings', to: 'settings#index'
  end

  namespace :site do
    resources :send_mail, only: [:edit, :create]
    get 'home', to: 'home#index'
    #get 'home', to: 'home#new'#, via: 'get'
    #get 'blog', to: 'blog#index'
  end

  namespace :blog do
    resources :categories
    get 'home', to: 'home#index'
    get 'categories', to: 'categories#index'
  end

  #devise
  devise_for :admins, :skip => [:registrations]
  devise_scope :admin do  
    get '/admins/sign_out' => 'devise/sessions#destroy'     
 end

  root 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
