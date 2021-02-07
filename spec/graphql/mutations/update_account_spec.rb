# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Mutations::UpdateAccount do
  subject(:resolver) { described_class.new(object: nil, context: {}, field: nil) }

  describe 'have correct arguments' do
    subject { described_class }

    it { is_expected.to accept_argument(:account_id).of_type('ID!') }
    it { is_expected.to accept_argument(:username).of_type('String') }
    it { is_expected.to accept_argument(:email).of_type('String') }
  end

  it('exist resolver method') { is_expected.to respond_to(:resolve) }

  context 'return correct values' do
    let(:account) { create(:account) }

    it do
      object = resolver.resolve(
        account_id: account.id,
        username: 'Nozomi',
        email: account.email
      )
      expect(object).to have_key(:account)
      expect(object[:account][:username]).to eq 'Nozomi'
    end
  end
end
