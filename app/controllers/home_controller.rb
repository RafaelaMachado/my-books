class HomeController < ApplicationController
  def index
    @search = Book.ransack(params[:q])
    @books = @search.result
    respond_with(@books)
  end
end