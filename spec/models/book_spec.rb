require 'rails_helper'

RSpec.describe Book, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:author_name) }
  it { is_expected.to validate_presence_of(:publisher_name) }
  it { is_expected.to validate_presence_of(:published_date) }
  it { is_expected.to validate_presence_of(:unit_price) }
  it { is_expected.to have_and_belong_to_many(:categories) }
end
