class Veterinarian < ApplicationRecord
  has_many :tests, dependent: :restrict_with_exception

  PHONE_REGEXP = /\A\+[1-9]\d{6,14}\z/

  validates :number, format: { with: PHONE_REGEXP }, on: :create
end
