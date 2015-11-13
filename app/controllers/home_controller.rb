class HomeController < ApplicationController
  before_action :require_login

  def welcome
    @books_on_sale = Book.where(for_what: 'sale', transacting: false).
        order(:created_at).limit(10)
    @books_on_purchase = Book.where(for_what: 'purchase', transacting: false).
        order(:created_at).limit(10)
  end

  private
  def require_login
    redirect_to login_path 	if !current_user
  end
end