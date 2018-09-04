require 'rails_helper'

describe BookSerializer do
  let(:book) { FactoryBot.create(:book) }
  it do
    serializer = BookSerializer.new(book)
    h = serializer.serializable_hash
    expect(h).to include(
      id: book.id,
      title: book.title,
      isbn: book.isbn,
    )
  end
end
