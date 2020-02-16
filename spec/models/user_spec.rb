require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  describe 'associations' do
    it { should have_one(:profile).dependent(:destroy) }
  end

  describe 'validations' do
    it { should be_valid }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password)}
  end  
end
