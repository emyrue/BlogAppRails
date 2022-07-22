FactoryBot.define do
  factory :user, class User do
    name {Faker::FunnyName}
    email {Faker::Internet.safe_email}
    password {Faker::Alphanumeric}
    bio {Faker::Quotes::Shakespeare.hamlet_quote}
    photo {Faker::FunnyName}
  end
end
