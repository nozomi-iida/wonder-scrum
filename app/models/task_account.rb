# frozen_string_literal: true
# Intermediate table between task and account
class TaskAccount < ApplicationRecord
  belongs_to :task
  belongs_to :account
end
