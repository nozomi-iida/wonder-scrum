# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Mutations::SignUpAccount do
  subject(:resolver) { described_class.new(object: nil, context: {}, field: nil) }

  describe 'have correct arguments' do
    subject { described_class }

    it { is_expected.to accept_argument(:username).of_type('String!') }
    it { is_expected.to accept_argument(:email).of_type('String!') }
    it { is_expected.to accept_argument(:password).of_type('String!') }
    it { is_expected.to accept_argument(:password_confirmation).of_type('String!') }
  end

  it('exist resolver method') { is_expected.to respond_to(:resolve) }

  context 'return correct values' do
    it do
      object = resolver.resolve(
        username: 'Nozomi',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(object).to have_key(:account)
      expect(object[:account][:username]).to eq 'Nozomi'
    end
  end
end
