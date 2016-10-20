FactoryGirl.define do
  factory :questionnaire do
    sequence(:title) { |n| "#{n}title" }
    sequence(:physician_name) { |n| "#Dr.{n}" }
    sequence(:clinic_phone) { |n| "#{n}23-456-7890" }
    sequence(:clinic_address) { |n| "#1 {n} Drive" }
    sequence(:status) { |n| "#{n}completed" }
    demographic_information false
    additional_information  false
  end
end
