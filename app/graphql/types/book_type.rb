class Types::BookType < Types::BaseObject
  description "A book"
  field :id, ID, null: false
  field :user_id, ID, null: false
  field :title, String, null: false
  field :isbn, String, null: false
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false
  field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
end
