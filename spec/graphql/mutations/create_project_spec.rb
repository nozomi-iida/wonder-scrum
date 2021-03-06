# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::CreateProject, skip: true do
  subject(:resolver) { described_class.new(object: nil, context: {}, field: nil) }

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:title).of_type('String!') }
    it { is_expected.to accept_argument(:account_id).of_type('ID') }
  end

  context 'return correct values' do
    let(:project) { build(:project) }
    it do
      object = resolver.resolve(
        title: project.title
      )

      expect(object).to have_key(:project)
      expect(object[:project]).to be_a Project
      expect(object[:project][:title]).to eq project.title
    end
  end
end
