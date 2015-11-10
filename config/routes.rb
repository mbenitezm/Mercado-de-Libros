Rails.application.routes.draw do
  root 'home#sign_in'
  scope constraints: ->(req) { req.session[:user_id].blank? } do
    get 'login', to: 'sessions#new', as: :new_login
    post 'login', to: 'sessions#create', as: :login
  end
end
