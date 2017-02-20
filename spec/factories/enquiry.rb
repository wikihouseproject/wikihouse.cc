FactoryGirl.define do

  factory :enquiry do
    first_name { "Homer" }
    last_name { "Simpson" }
    sequence(:email) { |n| "enquiry-user#{n}@example.com" }
  end

end
