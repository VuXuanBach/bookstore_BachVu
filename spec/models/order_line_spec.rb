require 'rails_helper'

RSpec.describe OrderLine, type: :model do
  it { is_expected.to belong_to(:order) }
  it { is_expected.to belong_to(:book) }
end
