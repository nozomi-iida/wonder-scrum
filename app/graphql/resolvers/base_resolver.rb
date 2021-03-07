# frozen_string_literal: true
module Resolvers
  # BaseResolver
  class BaseResolver < GraphQL::Schema::Resolver
    include Helpers::ContextAccessHelper
  end
end
