FactoryBot.define do
  factory :baseball do
    title        { "巨人VS阪神" }
    content      { Faker::Lorem.sentence }
    like_team_id { 2 }
  end
end
