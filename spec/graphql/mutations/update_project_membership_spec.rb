# frozen_string_literal: true
require 'rspec'

Rspec.describe Mutations::UpdateProjectMembership do
  include_context 'private_mutation_module'

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:project_membership_id).of_type('ID!') }
    it { is_expected.to accept_argument(:role).of_type('ProjectMembershipRole!') }
  end

  describe '#resolve' do
    subject(:result) { mutation.resolve(**params) }
    let(:project_membership) { create(:project_membership) }
    let(:params) { { project_membership_id: project_membership.id, role: 'admin' } }

    it 'update project membership' do
      expect(result).to have_key(:project_membership)
      expect(result[:project_membership]).to be_a ProjectMembership
      expect(result[:project_membership][:role]).to eq 'admin'
    end
  end
end
