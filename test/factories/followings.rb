FactoryBot.define do
  factory :following do
    follower { nil }
    followed_id { nil }
    follower_id { nil }
  end
end
