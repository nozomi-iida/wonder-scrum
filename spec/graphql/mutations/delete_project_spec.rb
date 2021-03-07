# frozen_string_literal: true
require 'rails_helper'

Rspec.describe Mutations::DeleteProject do
  subject(:mutation) { described_class.new(object: nil, context: context, field: nil) }

  let_it_be(:account) { create(:account) }
  let(:context) { { current_account: account } }

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:project_id).of_type('ID!') }
  end

  describe '#resolve' do
    subject(:result) { mutation.resolve(**params) }
    let(:project) { create(:project) }
    let(:params) { { project_id: project.id } }

    it 'delete project' do
      expect(result).to have_key(:project)
      expect(result[:project]).to be_a Project
      expect(result[:project].destroyed?).to eq true
    end
  end
end
