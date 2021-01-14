FactoryBot.define do
  factory :item do
    name                      {"牡蠣"}
    description               {"これは牡蠣です"}
    category_id               {2}
    sales_status_id           {2}
    shipping_fee_status_id    {2}
    prefecture_id             {2}
    scheduled_delivery_id     {2}
    price                     {3000}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end

  end
end
