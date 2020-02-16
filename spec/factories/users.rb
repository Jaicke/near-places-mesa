FactoryBot.define do
  factory :user do
    email { "user@mesa.inc" }
    password  { "12345678" }
		password_confirmation { "12345678" }
    association :profile, factory: :profile, strategy: :build
  end
end