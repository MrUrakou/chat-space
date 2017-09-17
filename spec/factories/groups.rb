FactoryGirl.define do

  factory :group do
    name                 "oyamadai"
    created_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
  end

end
