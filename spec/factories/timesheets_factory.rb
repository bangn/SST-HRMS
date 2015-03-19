FactoryGirl.define do
  factory :timesheet do
    working_date { Time.now }
    description { "dummy description" }
    duration { 2 }
  end
end
