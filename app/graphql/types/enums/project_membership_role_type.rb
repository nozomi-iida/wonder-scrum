# frozen_string_literal: true
module Types
  module Enums
    # ProjectMembershipRoleType
    class ProjectMembershipRoleType < Types::BaseEnum
      value 'OWNER', value: 'owner'
      value 'ADMIN', value: 'admin'
      value 'GENERAL', value: 'general'
    end
  end
end
