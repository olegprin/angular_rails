FactoryGirl.define do
  factory :artist do
    name "MyString"
    description "MyString"
  end
  factory :post do
    title "MyString"
    author "MyString"
    index "MyString"
  end
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
