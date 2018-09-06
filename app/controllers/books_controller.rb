class BooksController < ApplicationController
	authorize_resource

	def create
		@book = Book.new(book_params.merge!(user_id: current_user.id))
		@book.save!
		render :show
	end

	private

	def book_params
		params.require(:book).permit(:title)
	end
end
