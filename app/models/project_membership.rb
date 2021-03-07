# frozen_string_literal: true
# ProjectMembership
class ProjectMembership < ApplicationRecord
  belongs_to :account
  belongs_to :project

  enum role: { owner: 0, admin: 1, general: 2 }, _suffix: true
  enum state: { inviting: 0, active: 1, inactive: 2 }, _suffix: true

  validates :role, :state, presence: true
end
