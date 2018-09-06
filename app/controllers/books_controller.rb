class BooksController < ApplicationController
	authorize_resource

	def create
		@book = Book.new(book_params)
		@book.save!
		render :show
	end

	private

	def book_params
		params.require(:book).permit(:title)
	end
end
