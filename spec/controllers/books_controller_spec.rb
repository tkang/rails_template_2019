require 'rails_helper'

RSpec.describe BooksController, "GET #index" do
  let(:user) { FactoryBot.create(:user) }
  let!(:book) { FactoryBot.create(:book) }
  subject { get :index }

  context "if logged in" do
    before { sign_in(user) }

    it do
      expect(subject.status).to be(200)
      expect(subject).to render_template(:index)
    end
  end

  context "if not logged in" do
    it "should redirect to login page" do
      expect(subject.status).to be(302)
      expect(subject).to redirect_to(new_user_session_path)
    end
  end
end

RSpec.describe BooksController, "GET #show" do
  let(:user) { FactoryBot.create(:user) }
  let!(:book) { FactoryBot.create(:book) }
  subject { get :show, params: { id: book.id } }

  context "if logged in" do
    before { sign_in(user) }

    it do
      expect(subject.status).to be(200)
      expect(subject).to render_template(:show)
    end
  end

  context "if not logged in" do
    it "should redirect to login page" do
      expect(subject.status).to be(302)
      expect(subject).to redirect_to(new_user_session_path)
    end
  end
end


