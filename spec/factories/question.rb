FactoryGirl.define do
  factory :question do
    sequence(:content) { |n| "#{n}this is a new question" }
    reverse false
  end
end
