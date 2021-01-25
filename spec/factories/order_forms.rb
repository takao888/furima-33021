FactoryBot.define do
  factory :order_form do
    postal_code             {"111-1111"}
    prefecture_id           {"2"}
    city                    {"名古屋市"}
    address                 {5-1-3}
    phone_number            {"09012341234"}
    token                   {"tok_abcdefghijk00000000000000000"}
  end
end
