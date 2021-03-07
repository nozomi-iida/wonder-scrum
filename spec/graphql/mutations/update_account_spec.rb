# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Mutations::UpdateAccount do
  subject(:mutation) { described_class.new(object: nil, context: context, field: nil) }

  let_it_be(:account) { create(:account) }
  let(:context) { { current_account: account } }

  describe 'have correct arguments' do
    subject { described_class }

    it { is_expected.to accept_argument(:account_id).of_type('ID!') }
    it { is_expected.to accept_argument(:username).of_type('String') }
    it { is_expected.to accept_argument(:email).of_type('String') }
  end

  describe '#resolve' do
    subject(:result) { mutation.resolve(**params) }
    let(:params) { { account_id: account.id, username: 'Nozomi', email: account.email } }

    it 'OK' do
      expect(result).to have_key(:account)
      expect(result[:account][:username]).to eq 'Nozomi'
    end
  end
end
