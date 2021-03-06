# frozen_string_literal: true
require 'rails_helper'

Rspec.describe Mutations::UpdateProject, skip: true do
  subject(:resolver) { described_class.new(object: nil, context: {}, field: nil) }

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:project_id).of_type('ID!') }
    it { is_expected.to accept_argument(:title).of_type('String!') }
  end

  context 'return correct values' do
    let(:project) { create(:project) }
    it do
      object = resolver.resolve(
        project_id: project.id,
        title: project.title
      )

      expect(object).to have_key(:project)
      expect(object[:project]).to be_a Project
      expect(object[:project][:title]).to eq project.title
    end
  end
end
