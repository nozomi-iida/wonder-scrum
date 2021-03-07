# frozen_string_literal: true
require 'rspec'

Rspec.describe Mutations::InviteProjectMembership do
  subject(:mutation) { described_class.new(object: nil, context: context, field: nil) }

  let_it_be(:account) { create(:account) }
  let(:context) { { current_account: account } }

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:role).of_type('ProjectMembershipRole!') }
    it { is_expected.to accept_argument(:project_id).of_type('ID!') }
    it { is_expected.to accept_argument(:account_id).of_type('ID!') }
  end

  describe '#resolve' do
    subject(:result) { mutation.resolve(**params) }
    let!(:account) { create(:account) }
    let!(:project) { create(:project) }
    let(:params) { { role: 0, state: 0, project_id: project.id, account_id: account.id } }

    it 'invite member' do
      expect(result).to have_key(:project_membership)
      expect(result[:project_membership]).to be_a ProjectMembership
    end
  end
end
