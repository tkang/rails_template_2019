FactoryBot.define do
  factory :user do
    email { Forgery('email').address }
    password { '12345678' }

    factory :admin_user do
      after(:build) { |user| user.add_role(:admin) }
    end
  end
end
