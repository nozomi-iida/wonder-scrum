# frozen_string_literal: true
require 'rails_helper'

Rspec.describe Mutations::DeleteProject do
  subject(:resolver) { described_class.new(object: nil, context: {}, field: nil) }

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:project_id).of_type('ID!') }
  end

  context 'return correct values' do
    let(:project) { create(:project) }
    it do
      object = resolver.resolve(
        project_id: project.id
      )

      expect(object).to have_key(:project)
      expect(object[:project]).to be_a Project
      expect(object[:project].id).to eq project.id
      expect(object[:project].destroyed?).to eq true
    end
  end
end
