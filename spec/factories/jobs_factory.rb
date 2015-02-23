FactoryGirl.define do
  sequence(:job_name){|n| "Job #{n}"}
  factory :job do
    name { generate(:job_name) }
  end
end
