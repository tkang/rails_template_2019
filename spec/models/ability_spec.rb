require 'rails_helper'
require 'cancan/matchers'

RSpec.shared_examples "guest user" do
  it { should_not be_able_to(:manage, :all) }
end

RSpec.shared_examples "normal user" do
  it { should_not be_able_to(:manage, :all) }
  it { should be_able_to(:read, Book) }
end

RSpec.shared_examples "admin user" do
  it { should be_able_to(:manage, :all) }
end

describe User do
  subject(:ability) { Ability.new(user) }
  let(:user) { nil }

  context "for guest user" do
    it_behaves_like "guest user"
  end

  context "for logged in user" do
    let(:user) { FactoryBot.create(:user) }

    it_behaves_like "normal user"

    context "for admin user" do
      let(:user) { FactoryBot.create(:admin_user) }
      it_behaves_like "admin user"
    end
  end
end
