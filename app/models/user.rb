class User < ApplicationRecord
  authenticates_with_sorcery!
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :username, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { in: 6..30 }
  validates_confirmation_of :password, message: 'should match confirmation', if: :password
end
