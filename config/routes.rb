Rails.application.routes.draw do
  root 'home#welcome'
  #Sessions routes
  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create', as: :login_action
  get 'destroy_session', to: 'sessions#destroy', as: :destroy_session

  #Sign-up routes
  get 'signup', to: 'sign_up#new', as: :sign_up
  post 'signup', to: 'sign_up#create', as: :sign_up_action

  #Books routes
  get 'add_book', to: 'books#new', as: :add_book
  post 'add_book', to: 'books#create', as: :add_book_action
  get 'book/:id', to: 'books#show', as: :show_book

end
