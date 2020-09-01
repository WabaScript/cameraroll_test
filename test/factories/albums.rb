FactoryBot.define do
    factory :album do
        name { "New Album" }
        description { "great album!" }
        privacy { false }
        user_id { 1 }
        images { ["test.jpg"] }
    end
end