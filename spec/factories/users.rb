# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Barack"
    last_name "Obama"
    email "Barack@Obama.com"
    password "password"
    password_confirmation "password"
    active true
  end
end
