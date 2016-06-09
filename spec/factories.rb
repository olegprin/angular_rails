FactoryGirl.define do
  factory :angular do
    title "MyString"
    body "MyString"
  end
  factory :user do
    first_name "John"
    last_name  "Doe"
    admin false
  end
end  
