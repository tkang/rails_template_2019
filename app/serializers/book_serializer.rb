class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :isbn, :user

  def user
    UserSerializer.new(object.user).as_json
  end
end
