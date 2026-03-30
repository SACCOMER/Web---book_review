class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    unless @book
      redirect_to books_path, alert: "Book not found"
    end
  end

end
