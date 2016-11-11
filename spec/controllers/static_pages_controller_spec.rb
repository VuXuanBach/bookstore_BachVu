require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'GET #index' do
    context "format is html" do
      it 'returns success' do
        get :index
        expect(response).to be_success
      end
    end

    context "format is xhr" do
      it 'returns success' do
        get :index, format: :xhr
        expect(response).to be_success
      end
    end
  end
end
