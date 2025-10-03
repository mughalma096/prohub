class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar
  has_many :sessions, dependent: :destroy

  validates :first_name, presence: true
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def full_name
    "#{first_name} #{last_name}"
  end

end
