class Api::V1::BooksController < Api::V1::ApplicationController
  load_resource
  authorize_resource

  def index
    render json: @books, each_serializer: BookSerializer
  end
end

