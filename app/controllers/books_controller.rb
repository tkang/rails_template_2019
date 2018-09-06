class BooksController < ApplicationController
  load_resource
  authorize_resource

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
end
