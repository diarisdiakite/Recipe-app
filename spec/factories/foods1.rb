FactoryBot.define do
  factory :food1 do
    name { 'Sample Food' }
    measurement_unit { 'grams' }
    price { 10.99 }
    quantity { 1 }
  end
end
