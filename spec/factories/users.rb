FactoryBot.define do
  factory :user do
    nickname                {"taka"}
    email                   {"p@p"}
    password                {"ppp000"}
    encrypted_password      {"ppp000"}
    last_name               {"佐藤"}
    first_name              {"太郎"}
    kana_last_name          {"サトウ"}
    kana_first_name         {"タロウ"}
    birth_day               {"1941-08-13"}
  end
end