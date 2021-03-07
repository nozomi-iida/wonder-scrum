# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::CreateProject do
  include_context 'private_mutation_module'

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:title).of_type('String!') }
  end

  describe '#resolve' do
    subject(:result) { mutation.resolve(**params) }
    let(:params) { { title: 'test_project' } }

    it 'OK' do
      expect(result).to have_key(:project)
      expect(result[:project]).to be_a Project
    end
  end
end
