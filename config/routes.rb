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
  get 'books_on_sale', to: 'books#sale_index', as: :sale_books
  get 'books_on_purchase', to: 'books#purchase_index', as: :purchase_books
  get 'remove/:id', to: 'books#remove', as: :delete_book
  post 'remove/:id', to: 'books#remove', as: :delete_book_action
  get 'search', to: 'books#search', as: :search_book
  get 'search_result', to: 'books#search_result', as: :search_result
  post 'search_result', to: 'books#search_result', as: :search_result_action

  #Exchanges routes
  get 'transact/:book_id', to: 'exchanges#create', as: :new_exchange
  get 'transact/:book_id', to: 'exchanges#create', as: :new_exchange_action
  get 'transaction/:id',   to: 'exchanges#show', as: :show_exchange
  get 'finish/:book_id', to: 'exchanges#finish', as: :finish_exchange
  post 'finish/:id',   to: 'exchanges#finish', as: :finish_exchange_action
  get 'remove_exchange/:id', to: 'exchanges#remove', as: :delete_exchange
  post 'remove_exchange/:id', to: 'exchanges#remove', as: :delete_exchange_action
  get 'all_transactions/:id', to: 'exchanges#admin_exchanges', as: :admin_exchanges


  #User routes
  get 'my_account/:id', to: 'users#my_account', as: :my_account
  get 'edit_user/:id', to: 'users#edit', as: :edit_user
  patch 'edit_user/:id', to: 'users#update', as: :edit_user_action
  get 'users', to: 'users#all_users', as: :users
  get 'block/:id', to: 'users#change_state', as: :block
  post 'block/:id', to: 'users#change_state', as: :block_action

  #message routes
  get 'add_message/:id', to: 'messages#create', as: :new_message
  post 'add_message/:id', to: 'messages#create', as: :new_message_action
end
