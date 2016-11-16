require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:comment1) { create(:comment, commented_time: Faker::Time.backward(1)) }
  let!(:comment2) { create(:comment, commented_time: Time.now) }

  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_length_of(:content) }
  it { is_expected.to validate_presence_of(:user_id) }
  it { is_expected.to validate_presence_of(:book_id) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:book) }

  describe 'list of comments' do
    it 'should have correct order' do
      expect(Comment.all.to_a).to eq [comment2, comment1]
    end
  end
end
