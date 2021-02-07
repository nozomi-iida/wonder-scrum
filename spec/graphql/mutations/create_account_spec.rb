# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::CreateAccount do
  subject(:resolver) { described_class.new(object: nil, context: {}, field: nil) }

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:username).of_type('String!') }
    it { is_expected.to accept_argument(:email).of_type('String!') }
    it { is_expected.to accept_argument(:password).of_type('String!') }
    it { is_expected.to accept_argument(:password_confirmation).of_type('String!') }
  end

  context 'return correct values' do
    let(:account) { build(:account) }
    it do
      object = resolver.resolve(
        username: account.username,
        email: account.email,
        password: account.password,
        password_confirmation: account.password_confirmation
      )

      expect(object).to have_key(:account)
      expect(object[:account]).to be_a Account
      expect(object[:account][:username]).to eq account.username
    end
  end
end
