# frozen_string_literal: true

# Task
class Task < ApplicationRecord
  belongs_to :creator, class_name: 'Account'
  belongs_to :project

  has_many :task_accounts
  has_many :assignees, through: :task_accounts, source: :account

  enum state: { to_do: 0, this_week: 1, today: 2, doing: 3, done: 4 }, _suffix: true

  validates :name, :state, presence: true
end
