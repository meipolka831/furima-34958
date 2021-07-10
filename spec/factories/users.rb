FactoryBot.define do
  factory :user do
    id {"1"}
    nickname {"aaa"}
    email {"aaa@icloud.com"}
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    surname {"あ"}
    name {"あ"}
    surnamekana {"ア"}
    namekana {"ア"}
    birthday {"1930-09-09"}
  end
end