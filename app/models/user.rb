class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable, :async

  VALID_PHONE_REGEX = /\A(\+\d)*\s*(\(\d{3}\)\s*)*\d{3}(-{0,1}|\s{0,1})\d{2}(-{0,1}|\s{0,1})\d{2}/
  validates :phone, format: { with: VALID_PHONE_REGEX }, allow_blank: true

  validates_each :birthday do |record, attr, value|
    record.errors.add(attr, 'Birthday must be in the past') if value && value >= Time.now.to_date
  end

  validates_each :birthday do |record, attr, value|
    record.errors.add(attr, 'Birthdat must be less than 150 years in the past') if value && value <= (Time.now.to_date - 125.years)
  end
end
