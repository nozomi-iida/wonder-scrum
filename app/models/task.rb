# frozen_string_literal: true

# Task
class Task < ApplicationRecord
  belongs_to :creator, class_name: 'Account'
  belongs_to :project

  enum state: { TO_DO: 0, THIS_WEEK: 1, TODAY: 2, DOING: 3, DONE: 4 }, _suffix: true

  validates :name, :state, presence: true
end
