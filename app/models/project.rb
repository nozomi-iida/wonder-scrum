# frozen_string_literal: true
# Project
class Project < ApplicationRecord
  belongs_to :creator, class_name: 'Account'
  has_many :tasks
  has_many :project_memberships

  validates :title, presence: true
end
