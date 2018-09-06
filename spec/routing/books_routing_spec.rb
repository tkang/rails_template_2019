require 'rails_helper'

describe BooksController do
  it { expect(get: '/books').to route_to(controller: "books", action: "index") }
  it { expect(get: '/books/1').to route_to(controller: "books", action: "show", id: '1') }
  it { expect(post: '/books').to route_to(controller: "books", action: "create") }
  it { expect(delete: '/books/1').to route_to(controller: "books", action: "destroy", id: '1') }
end
