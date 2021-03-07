# frozen_string_literal: true
module Types
  module Enums
    # ProjectMembershipStateType
    class ProjectMembershipStateType < Types::BaseEnum
      value 'INVITING', value: 'inviting'
      value 'ACTIVE', value: 'active'
      value 'INACTIVE', value: 'inactive'
    end
  end
end
