FactoryBot.define do
  factory :dream_log do
    dream { false }
    remember { false }
    body { "MyText" }
    sleep_time { 1 }
    journal { nil }
  end
end
