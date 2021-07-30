FactoryBot.define do
  factory :product do
    association :user
    name {"aaa"}
    detail {"aaa"}
    area_id {"2"}
    status_id {"2"}
    burden_id {"2"}
    shipping_date_id {"2"}
    category_id {"2"}
    money {"1000"}
  end
end
