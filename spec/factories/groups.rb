FactoryGirl.define do

  factory :group do
    name    { Faker::Pokemon.name }
    created_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  end

end
