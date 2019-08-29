Rails.application.routes.draw do

  #devise_for :users, :controllers => {sessions: 'sessions', registrations: 'registrations'}
  devise_scope :user do
    post "/sign_in", :to => 'sessions#create'
    post "/sign_up", :to => 'registrations#create'
    delete "/sign_out", :to => 'sessions#destroy'
    resources :roles
    resources :users  do
      resources :hours
    end
  end
  devise_for :users

end
