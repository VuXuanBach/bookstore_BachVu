require 'rails_helper'

RSpec.describe OrderLinesController, type: :controller do
  describe 'POST create' do
    context 'save successfully' do
      let(:book) { create(:book) }

      it 'sets flash success' do
        xhr :post, :create, book_id: book
        expect(flash.now[:success]).to eq 'Book is added to order successfully'
        expect(OrderLine.last.book).to eq book
      end
    end

    context 'save failed' do
      it 'sets flash error' do
        expect {
          xhr :post, :create
        }.not_to change { OrderLine.count }
        expect(flash.now[:error]).to eq 'Book is not added to order'
      end
    end
  end
end
