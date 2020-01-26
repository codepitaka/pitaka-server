FactoryBot.define do
  factory :snippet do
    post_id { 1 }
    status { 1 }
    prog_language { "MyString" }
    code { "MyText" }
  end
end
