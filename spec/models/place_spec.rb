require 'rails_helper'

RSpec.describe Place, type: :model do

  describe 'associations' do
    it { should have_many(:ratings).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_uniqueness_of(:name) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:state) }
  end  
end
