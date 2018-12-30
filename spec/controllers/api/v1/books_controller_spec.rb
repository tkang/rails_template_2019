require 'rails_helper'

RSpec.describe Api::V1::BooksController, "GET #index" do
	let(:user) { FactoryBot.create(:user) }
  let!(:book) { FactoryBot.create(:book) }
	subject { get :index }

	context "if not logged in" do
    it_behaves_like "requires authentication"
	end

  context "with authentication token" do
    let(:expected_json) { [ BookSerializer.new(book).as_json ] }
    before { authenticate_user(user) }
    it_behaves_like "returns json data"
  end
end

