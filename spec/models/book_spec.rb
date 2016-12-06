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
  it { is_expected.to have_many(:comments) }

  describe 'book is searchable' do
    let(:book) { create(:book) }

    it 'has result when search books with correct query' do
      books = Book.search_by_book_info(book.title)
      expect(books).not_to be_empty
    end

    it 'does not have result when search books with incorrect query' do
      books = Book.search_by_book_info('somethingrandom')
      expect(books).to be_empty
    end
  end

  describe 'delete a book' do
    let!(:book) { create(:book) }

    context 'order exists' do
      it 'can be delete' do
        expect{ Book.destroy(book.id) }.to change(Book, :count).by(-1)
      end
    end

    context 'no order exists' do
      it 'cannot be deleted' do
        order = Order.create
        order_line = order.order_lines.create(book: book)

        expect{ Book.destroy(book.id) }.not_to change(Book, :count)
      end
    end
  end
end
