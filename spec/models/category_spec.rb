require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category1 = create(:category, sort_order: 2)
    @category2 = create(:category, sort_order: 1)
  end

  describe 'Categories' do
    it 'should have correct order' do
      expect(Category.all.to_a).to eq [@category2, @category1]
    end
  end
end
