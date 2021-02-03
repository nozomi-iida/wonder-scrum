# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Mutations::CreateAccount do
  subject(:resolver) { described_class.new(object: nil, filed: nil, context: {}) }

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:username).of_type('String!') }
  end
end
