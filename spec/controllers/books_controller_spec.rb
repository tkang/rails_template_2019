require 'rails_helper'

RSpec.shared_examples "should redirect to login page" do
  it { expect(subject.status).to be(302) }
  it { expect(subject).to redirect_to(new_user_session_path) }
end

RSpec.shared_examples "should redirect to root page" do
  it { expect(subject.status).to be(302) }
  it { expect(subject).to redirect_to(root_path) }
end

RSpec.shared_examples "should render show page" do
  it { expect(subject.status).to be(200) }
  it { expect(subject).to render_template(:show) }
end

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

    it do
      subject
      expect(assigns(:books)).to eq(Book.all)
    end
  end

  context "if not logged in" do
    it_behaves_like "should redirect to login page"
  end
end

RSpec.describe BooksController, "GET #show" do
  let(:user) { FactoryBot.create(:user) }
  let!(:book) { FactoryBot.create(:book) }
  subject { get :show, params: { id: book.id } }

  context "if logged in" do
    before { sign_in(user) }

    it_behaves_like "should render show page"

    it do
      subject
      expect(assigns(:book)).to eq(Book.last)
    end
  end

  context "if not logged in" do
    it_behaves_like "should redirect to login page"
  end
end

RSpec.describe BooksController, "POST #create" do
  let(:user) { FactoryBot.create(:user) }
  let(:admin_user) { FactoryBot.create(:admin_user) }

  subject { post :create, params: { book: { title: 'book1' } } }

  context "if logged in with normal user" do
    before { sign_in(user) }

    it_behaves_like "should redirect to root page"
  end

  context "if logged in with admin user" do
    before { sign_in(admin_user) }

    it_behaves_like "should render show page"

    it 'creates a book' do
      subject
      expect(assigns(:book)).to eq(Book.last)
      expect(Book.last.user).to eq(admin_user)
    end
  end

  context "if not logged in" do
    it_behaves_like "should redirect to login page"
  end
end

RSpec.describe BooksController, "DELETE #destroy" do
  let(:user) { FactoryBot.create(:user) }
  let(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:book) { FactoryBot.create(:book) }

  subject { delete :destroy, params: { id: book.id } }

  context "if logged in with normal user" do
    before { sign_in(user) }

    it_behaves_like "should redirect to root page"
  end

  context "if logged in with admin user" do
    before { sign_in(admin_user) }

    it { expect(subject.status).to be(302) }
    it { expect(subject).to redirect_to(books_path) }

    it 'deletes a book' do
      subject
      expect(assigns(:book)).to eq(book)
      expect(Book.find_by(id: book.id)).to be_nil
    end
  end

  context "if not logged in" do
    it_behaves_like "should redirect to login page"
  end
end


