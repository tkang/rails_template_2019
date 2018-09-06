require 'rails_helper'
require 'cancan/matchers'


describe User do
  subject(:ability) { Ability.new(user) }
  let(:user) { nil }

  context "for guest user" do
  end

  context "for logged in user" do
    let(:user) { FactoryBot.create(:user) }

    it { should be_able_to(:manage, :all) }
  end
end
