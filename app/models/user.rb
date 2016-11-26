class User < ActiveRecord::Base
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable, :async

  VALID_PHONE_REGEX = /\A(\+\d)*\s*(\(\d{3}\)\s*)*\d{3}(-{0,1}|\s{0,1})\d{2}(-{0,1}|\s{0,1})\d{2}/
  validates :phone, format: { with: VALID_PHONE_REGEX, message: 'Please use valid format of your local/international phone number' }, allow_blank: true

  validate :birthday_cannot_be_in_future_and_in_past_150_years

  private

  def birthday_cannot_be_in_future_and_in_past_150_years
    errors.add(:birthday, 'Birthday must be in the past and less than 150 years') if
    birthday && (birthday >= Date.current || birthday <= (Date.current - 150.years))
  end
end
