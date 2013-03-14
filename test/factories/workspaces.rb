# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :workspace do
    name "MyString"
    id 1
    app nil
  end
end
