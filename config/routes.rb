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
    resources :professionals, except: [:show]
    resources :health_insurances, except: [:show]
    resources :categories#, except: [:show]
    resources :posts#, except: [:show]
    resources :diaries, except: [:show]
    resources :settings, except: [:show]
    resources :category_courses, except: [:show]
    resources :courses
    resources :site_storages
    resources :download_categories
    resources :downloads
    resources :instagram_pages
    resources :psi_tests
    resources :test_emails
    get 'admin', to: 'home#index'
    get 'admins', to: 'admins#index'
    get 'questions', to: 'questions#index'
    get 'projects', to: 'projects#index'
    get 'works', to: 'works#index'
    get 'flags', to: 'flags#index'
    get 'services', to: 'services#index'
    get 'health_insurances', to: 'health_insurances#index'
    get 'categories', to: 'categories#index'
    get 'diaries', to: 'diaries#index'
    get 'settings', to: 'settings#index'
    get 'category_courses', to: 'category_courses#index'
    get 'courses', to: 'courses#index'
  end

  namespace :site do
    resources :send_mail, only: [:edit, :create]
    resources :send_mail_tests, only: [:edit, :create]
    resources :courses, only: [:show, :index], path: 'cursos'
    resources :downloads, only: [:show, :index], path: 'downloads'
    resources :psi_tests, only: [:index, :show], path: 'testes' do
      member do
        patch :save_email, path: 'novo-teste'
        get :result, path: 'resultado'
        # get :unsubscribe, path: 'desinscrever'
        # patch :update, path: 'update'
      end
    end
    get 'home', to: 'home#index'
    get 'politicas-de-privacidade', to: 'licenses#privacy_policy'
    get 'termos-de-uso', to: 'licenses#terms_use'
    get 'politicas-de-cookies', to: 'licenses#cookie_policy'
    get 'politicas-de-cookies', to: 'licenses#cookie_policy'
    # get 'desinscrever', to: 'settings#unsubscribe'
    # resources :settings, only: [:index] do
    #   patch :unsubscribe
    # end
    get 'settings/unsubscribe'
    get 'settings/unsubscribed'
    patch 'settings/update'

  end

  namespace :blog do
    resources :categories, path: 'categorias'
    resources :posts, only: [:show, :index]
    root :to => "posts#index"
  end

  resources :instagram_pages, only: [:index], path: 'instagram'#, as: 'instagram'

  #devise
  devise_for :admins, :skip => [:registrations]
  devise_scope :admin do
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end

  # root path
  root 'site/home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
