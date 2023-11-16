FactoryBot.define do
  factory :recipe do
    name { "Sample Recipe" }
    preparation_time { 30 }
    cooking_time { 60 }
    description { "Delicious recipe description." }
  end
end