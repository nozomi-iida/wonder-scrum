# frozen_string_literal: true
require 'rspec'

Rspec.describe Mutations::DeleteProjectMembership do
  include_context 'private_mutation_module'

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:project_membership_id).of_type('ID!') }
  end

  describe '#resolver' do
    subject(:result) { mutation.resolve(**params) }
    let(:project_membership) { create(:project_membership) }
    let(:params) { { project_membership_id: project_membership.id } }

    it 'delete project member ship' do
      expect(result).to have_key(:project_membership)
      expect(result[:project_membership]).to be_a ProjectMembership
      expect(result[:project_membership].destroyed?).to eq true
    end
  end
end
