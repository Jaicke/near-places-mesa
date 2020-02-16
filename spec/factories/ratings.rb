FactoryBot.define do
  factory :rating do
    note { "5" }
    comment { "comment" }
		user
		place
  end
end