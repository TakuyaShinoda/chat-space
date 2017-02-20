FactoryGirl.define do

  factory :message do
  	body       { Faker::Pokemon.name }
  	user_id    "4"
  	group_id   "4"
  	created_at { Faker::Date.between(2.days.ago, Date.today) }
  	updated_at { Faker::Date.between(2.days.ago, Date.today) }
  end
end