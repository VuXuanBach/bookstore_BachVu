require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:category1) { create(:category, sort_order: 2) }
  let!(:category2) { create(:category, sort_order: 1) }

  describe 'list of categories' do
    it 'should have correct order' do
      expect(Category.all.to_a).to eq [category2, category1]
    end
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to have_and_belong_to_many(:books) }
end
