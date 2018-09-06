require 'rails_helper'

describe UserSerializer do
  let(:user) { FactoryBot.create(:user) }
  it do
    serializer = UserSerializer.new(user)
    h = serializer.serializable_hash
    expect(h).to include(
      id: user.id,
      email: user.email,
    )
  end
end
