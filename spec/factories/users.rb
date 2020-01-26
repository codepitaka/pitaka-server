FactoryBot.define do
  factory :user do
    name { "MyString" }
    description { "MyText" }
    email { "MyString" }
    password_digest { "MyString" }
  end
end
