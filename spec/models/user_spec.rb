require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = create(:user) }

  subject { @user }

  describe 'phone validation' do
    ['123456789', '+8438112451', ''].each do |valid|
      it { is_expected.to allow_value(valid).for(:phone) }
    end
    ['qwerty', '#@~123456789'].each do |invalid|
      it { is_expected.not_to allow_value(invalid).for(:phone) }
    end
  end

  describe 'birthday validation' do
    [Faker::Date.backward(100)].each do |valid|
      it { is_expected.to allow_value(valid).for(:birthday) }
    end
    [Time.now, Faker::Date.forward(23), Date.current - 150.years].each do |invalid|
      it { is_expected.not_to allow_value(invalid).for(:birthday) }
    end
  end
end
