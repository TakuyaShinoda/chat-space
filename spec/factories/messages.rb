FactoryGirl.define do

  factory :message do
  	body       { Faker::Pokemon.name }
  	created_at { Faker::Time.between(DateTime.now - 1, DateTime.now) }
  	user
  	group
  end

end
