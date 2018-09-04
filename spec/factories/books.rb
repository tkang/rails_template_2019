FactoryBot.define do
  factory :book do
    title { Forgery('lorem_ipsum').title }
    isbn { SecureRandom.uuid }
  end
end
