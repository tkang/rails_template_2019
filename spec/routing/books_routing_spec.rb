require 'rails_helper'

describe BooksController do
  it { expect(get: '/books').to route_to(controller: "books", action: "index") }
  it { expect(get: '/books/1').to route_to(controller: "books", action: "show", id: '1') }
end
