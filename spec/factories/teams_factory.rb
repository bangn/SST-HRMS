FactoryGirl.define do
  sequence(:name){|n| "Team #{n}"}
  factory :team do
    name { generate(:name) }
  end
end
