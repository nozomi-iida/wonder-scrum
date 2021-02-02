# frozen_string_literal: true
# Account
class Account < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  EMAIL_REGEXP = %r{\A[a-zA-Z0-9.!\#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9]
(?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z}.freeze
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEXP
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
end
