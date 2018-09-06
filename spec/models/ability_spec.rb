require 'rails_helper'
require 'cancan/matchers'


describe User do
  subject(:ability) { Ability.new(user) }
  let(:user) { nil }

  context "for guest user" do
    it { should_not be_able_to(:manage, :all) }
  end

  context "for logged in user" do
    let(:user) { FactoryBot.create(:user) }
    it { should_not be_able_to(:manage, :all) }

    context "for admin user" do
      let(:user) { FactoryBot.create(:admin_user) }

      it { should be_able_to(:manage, :all) }
    end
  end
end
