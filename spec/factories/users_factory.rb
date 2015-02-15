FactoryGirl.define do
  sequence(:email){|n| "user#{n}@strongtie.com"}
  factory :user do
    email { generate(:email) }
    password "12345678"
    password_confirmation "12345678"
    factory :admin do
      email "admin@strongtie.com"
      admin true
    end
  end
end
