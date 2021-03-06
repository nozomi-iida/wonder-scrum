# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::SignInAccount do
  let(:mutation) { described_class.new(object: nil, context: {}, field: nil) }

  let_it_be(:account) { create(:account, password: 'password') }

  describe 'have correct arguments' do
    subject { described_class }

    it { is_expected.to accept_argument(:email).of_type('String!') }
    it { is_expected.to accept_argument(:password).of_type('String!') }
  end

  describe '#resolve' do
    subject(:result) { mutation.resolve(**params) }

    context 'correct log in information' do
      let(:params) { { email: account.email, password: 'password' } }

      it 'OK' do
        expect(result).to have_key(:account)
        expect(result).to have_key(:token)
        expect(result[:account]).to be_a Account
        expect(result[:token]).to be_a String
      end
    end

    context 'incorrect log in information' do
      let(:params) { { email: account.email, password: 'hoge' } }

      it 'UnauthorizedError' do
        expect { result }.to raise_error(Exceptions::UnauthorizedError)
      end
    end
  end
end
