FactoryBot.define do
  factory :product do
    association :user
    name {"aaa"}
    detail {"aaa"}
    area_id {2}
    status_id {2}
    burden_id {2}
    shipping_date_id {2}
    category_id {2}
    money {1000}


    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    
  end
end
