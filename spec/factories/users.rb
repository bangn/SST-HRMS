FactoryGirl.define do
  factory :user do
    email { generate(:email) }
    password "12345678"
    password_confirmation "12345678"
    factory :admin_user do
      email "admin@admin.com"
      admin true
    end
  end
end
