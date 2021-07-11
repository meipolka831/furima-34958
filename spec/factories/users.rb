FactoryBot.define do
  factory :user do
    nickname {"aaa"}
    email {Faker::Internet.free_email}
    password {"aaa111"}
    password_confirmation {"aaa111"}
    surname {"あ"}
    name {"あ"}
    surnamekana {"ア"}
    namekana {"ア"}
    birthday {"1930-09-09"}
  end
end