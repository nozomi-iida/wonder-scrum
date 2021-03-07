# frozen_string_literal: true

# Account
class Account < ApplicationRecord
  include JWT::Authenticatable

  has_secure_password

  has_many :tasks
  has_many :projects
  has_many :project_memberships

  validates :username, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 8 }, if: -> { password.present? }
end
