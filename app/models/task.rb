class Task < ApplicationRecord
  belongs_to :account

  validates :name, :state, :closed, presence: true
end
