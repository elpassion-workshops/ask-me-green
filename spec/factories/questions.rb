FactoryBot.define do

  factory sequence :title do |n|
    "title#{n}"
  end

  factory :question do
    question.title {Factory.next(:title)}
    question.content 'content'
    user
  end
end