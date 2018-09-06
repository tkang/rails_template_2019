class BooksController < ApplicationController
  authorize_resource

  before_action :set_book, only: [ :show, :destroy ]
  before_action :set_books, only: [ :index ]

  def create
    @book = Book.new(book_params.merge!(user_id: current_user.id))
    @book.save!
    render :show
  end

  def destroy
    @book.destroy!
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def set_books
    @books = Book.all
  end
end
