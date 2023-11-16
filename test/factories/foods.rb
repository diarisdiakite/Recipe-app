FactoryBot.define do
  factory :food do
    user { nil }
    name { 'MyString' }
    measurement_unit { 1 }
    price { 1 }
    quantity { 1 }
  end
end
