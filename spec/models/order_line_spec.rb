require 'rails_helper'

RSpec.describe OrderLine, type: :model do
  it { is_expected.to belong_to(:order) }
  it { is_expected.to belong_to(:book) }
  it { is_expected.to validate_presence_of(:order) }
  it { is_expected.to validate_presence_of(:book) }
  it { is_expected.to validate_numericality_of(:quantity).is_greater_than_or_equal_to(1) }
end
