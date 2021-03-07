# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Mutations::DeleteAccount do
  subject(:mutation) { described_class.new(object: nil, context: context, field: nil) }

  let_it_be(:account) { create(:account) }
  let(:context) { { current_account: account } }

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:account_id).of_type('ID!') }
  end

  context 'return correct values' do
    subject(:result) { mutation.resolve(**params) }
    let(:account) { create(:account) }
    let(:params) { { account_id: account.id } }

    it 'delete account ' do
      expect(result).to have_key(:account)
      expect(result[:account]).to be_a Account
      expect(result[:account].destroyed?).to eq true
    end
  end
end
