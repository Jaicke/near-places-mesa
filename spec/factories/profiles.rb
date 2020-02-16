FactoryBot.define do
  factory :profile do
    name { "user" }
    street  { "street" }
		city { "city" }
		country { "country" }
		state { "state" }
		user_id { 1 }
  end
end