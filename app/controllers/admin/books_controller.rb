# frozen_string_literal: true

module Admin
  class BooksController < BaseController
    before_action :set_book, only: %i[edit update destroy]

    def index
      @search = Book.ransack(params[:q])
      @books = @search.result
      respond_with(@books)
    end

    def new
      @authors = Author.all.map { |a| [a.name, a.id] }
      @book = Book.new
      respond_with(@book)
    end

    def create
      @book = Book.create(book_params)
      respond_with @book, location: -> { admin_books_path }
    end

    def edit
      @authors = Author.all.map { |a| [a.name, a.id] }
      respond_with(@book)
    end

    def update
      @book.update(book_params)
      respond_with @book, location: -> { admin_books_path }
    end

    def destroy
      @book.destroy
      respond_with @book, location: -> { admin_books_path }
    end

    private

    def book_params
      params.require(:book).permit(:title, :description, :image, :author_id, :search)
    end

    def set_book
      @book = Book.friendly.find(params[:id])
    end
  end
end
