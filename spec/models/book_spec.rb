require 'rails_helper'

RSpec.describe Book, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:author_name) }
  it { is_expected.to validate_presence_of(:publisher_name) }
  it { is_expected.to validate_presence_of(:published_date) }
  it { is_expected.to validate_presence_of(:unit_price) }
  it { is_expected.to have_and_belong_to_many(:categories) }
  it { is_expected.to validate_numericality_of(:unit_price).is_greater_than_or_equal_to(0) }
  it { is_expected.to validate_numericality_of(:total_rating_value).is_greater_than_or_equal_to(0) }
  it { is_expected.to validate_numericality_of(:total_rating_count).is_greater_than_or_equal_to(0) }

  describe 'search books' do
    before { create(:book, title: 'some thing') }

    it 'has result when search books with correct query' do
      books = Book.search_by_book_info('some')
      expect(books).not_to be_empty
    end

    it 'does not have result when search books with correct query' do
      books = Book.search_by_book_info('asd')
      expect(books).to be_empty
    end
  end
end
