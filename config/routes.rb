Rails.application.routes.draw do
  as :user do
    get '/register', to: 'registrations#new', as: 'register'
  end

  devise_for :users, controllers: { registrations: 'registrations' }
  scope '/admin' do
    resources :users, except: [:new]
    as :users do
      # Admin pages go here
    end
  end

  resources :settings, only: [:index]
  scope '/settings' do
    resources :companies, except: [:index]
  end

  root 'welcome#index'
end
