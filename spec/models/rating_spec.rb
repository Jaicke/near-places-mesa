require 'rails_helper'

RSpec.describe Rating, type: :model do
  subject { build(:rating) }

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:place) }
  end

  describe 'validations' do
    it { should validate_presence_of(:note) }
    it { should validate_numericality_of(:note).is_greater_than_or_equal_to(0)}
    it { should validate_numericality_of(:note).is_less_than_or_equal_to(5)}
  end  
end
