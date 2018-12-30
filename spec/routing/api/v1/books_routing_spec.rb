require 'rails_helper'

describe Api::V1::BooksController do
  it { expect(get: '/api/v1/books').to route_to(controller: "api/v1/books", action: "index") }
end
