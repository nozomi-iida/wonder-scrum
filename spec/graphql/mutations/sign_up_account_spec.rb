# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Mutations::SignUpAccount do
  let(:mutation) { described_class.new(object: nil, context: {}, field: nil) }

  describe 'have correct arguments' do
    subject { described_class }

    it { is_expected.to accept_argument(:username).of_type('String!') }
    it { is_expected.to accept_argument(:email).of_type('String!') }
    it { is_expected.to accept_argument(:password).of_type('String!') }
    it { is_expected.to accept_argument(:password_confirmation).of_type('String!') }
  end

  describe '#resolve' do
    subject(:result) { mutation.resolve(**params) }

    context 'return sign up information' do
      let(:params) do
        { username: account.username,
          email: account.email,
          password: 'password',
          password_confirmation: 'password' }
      end
      let!(:account) { build(:account) }

      it 'OK' do
        expect(result).to have_key(:account)
        expect(result).to have_key(:token)
        expect(result[:account]).to be_a Account
        expect(result[:token]).to be_a String
      end
    end
  end
end
