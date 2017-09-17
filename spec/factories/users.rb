FactoryGirl.define do

  pass = "testtest"

  factory :user do
    sequence(:name) {|n| "#{n}taro" }
    sequence(:email) {|n| "example_#{n}@example.com" }
    password              pass
    password_confirmation pass
  end
end


