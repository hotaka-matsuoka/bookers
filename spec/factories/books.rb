FactoryBot.define do
  factory :book do
    sequence(:title) { |n| "イベント#{n}" }
    sequence(:body) { |n| "イベント#{n}" }  
  end
end