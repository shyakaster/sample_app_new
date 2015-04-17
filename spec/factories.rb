FactoryGirl.define do
  factory :user do
    name "test user"
    email "testing@gmail.com"
    password "beatrice"
    password_confirmation "beatrice"
  end
end