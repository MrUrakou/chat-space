FactoryGirl.define do

  pass = "testtest"

  factory :user do
    name                  "urata"
    email                 "btz@gmail.com"
    password              pass
    password_confirmation pass

    after(:create) do |user|
      create(:group_user, user: user, group: create(:group))
    end
  end

end
