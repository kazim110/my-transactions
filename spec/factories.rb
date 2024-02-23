FactoryBot.define do
  factory :user, aliases: [:author] do
    sequence(:name) { |n| "User #{n}" }
    email { Faker::Internet.email }
    password { 'password123' }
  end

  factory :category do
    sequence(:name) { |n| "Sample Category #{n}" }
    icon { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/sample_icon.png'), 'image/png') }
  end

  FactoryBot.define do
    factory :purchase do
      sequence(:name) { |n| "Purchase #{n}" }
      amount { Faker::Number.number(digits: 2) } # Generates a random integer with 2 digits
      association :author, factory: :user
      category
    end
  end

  factory :purchase_with_category, traits: [:with_category]
end
