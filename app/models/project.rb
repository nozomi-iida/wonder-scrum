# frozen_string_literal: true
# Project
class Project < ApplicationRecord
  has_many :tasks

  validates :title, presence: true
end
