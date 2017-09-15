FactoryGirl.define do

  pass = "testtest"

  factory :user do
    name                  "urata"
    email                 "btz@gmail.com"
    password              pass
    password_confirmation pass
  end

end
