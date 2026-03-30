class BooksController < ApplicationController
  def index
    if Book.count == 0
      Rails.application.load_tasks
      Rake::Task['db:migrate'].invoke
      Rake::Task['db:seed'].invoke
    end

    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    unless @book
      redirect_to books_path, alert: "Book not found"
    end
  end

end
