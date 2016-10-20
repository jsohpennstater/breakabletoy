FactoryGirl.define do
  factory :questionnaire do
    sequence(:title) { |n| "#{n}title" }
    sequence(:physician_name) { |n| "#{n}Dr" }
    sequence(:clinic_phone) { |n| "#{n}23-456-7890" }
    sequence(:clinic_address) { |n| "#{n}Drive" }
    sequence(:status) { |n| "#{n}completed" }
    demographic_information false
    additional_information  false
  end
end
