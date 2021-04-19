FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph(sentence_count: 10) }
    user

    factory :invalid_article do
      title { nil }
    end
  end
end
