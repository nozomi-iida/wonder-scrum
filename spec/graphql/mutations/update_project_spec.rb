# frozen_string_literal: true
require 'rails_helper'

Rspec.describe Mutations::UpdateProject do
  include_context 'private_mutation_module'

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:project_id).of_type('ID!') }
    it { is_expected.to accept_argument(:title).of_type('String!') }
  end

  describe '#resolve' do
    subject(:result) { mutation.resolve(**params) }
    let(:project) { create(:project) }
    let(:params) { { project_id: project.id, title: 'updated_project' } }

    it 'update task' do
      expect(result).to have_key(:project)
      expect(result[:project]).to be_a Project
      expect(result[:project][:title]).to eq 'updated_project'
    end
  end
end
