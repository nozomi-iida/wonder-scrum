# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Mutations::SignInAccount do
  subject(:resolver) { described_class.new(object: nil, context: {}, field: nil) }

  describe 'have correct arguments' do
    subject { described_class }

    it { is_expected.to accept_argument(:email).of_type('String!') }
    it { is_expected.to accept_argument(:password).of_type('String!') }
  end

  it('exist resolver method') { is_expected.to respond_to(:resolve) }

  context 'return correct values' do
    let(:account) { create(:account) }
    it do
      object = resolver.resolve(
        email: account.email,
        password: 'password'
      )
      expect(object).to have_key(:account)
      expect(object[:account][:username]).to eq account.username
    end
  end
end
