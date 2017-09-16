FactoryGirl.define do

  factory :message do
    user
    group
    text                 "hello!"
  end

end
