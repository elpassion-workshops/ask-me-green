FactoryBot.define do

  factory :question do
    sequence(:title) { |n| "question #{n}" }
    sequence(:content) { |n| "content #{n}" }

  end
end