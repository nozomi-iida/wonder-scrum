# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::CreateTask do
  subject(:mutation) { described_class.new(object: nil, context: context, field: nil) }

  let_it_be(:account) { create(:account) }
  let(:context) { { current_account: account } }

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:name).of_type('String!') }
    it { is_expected.to accept_argument(:state).of_type('TaskState!') }
    it { is_expected.to accept_argument(:assignee_ids).of_type('[ID!]') }
    it { is_expected.to accept_argument(:project_id).of_type('ID!') }
  end

  # FIXME: How to test if resolve can make assignees
  describe '#resolve' do
    subject(:result) { mutation.resolve(**params) }
    let(:project) { create(:project) }
    let(:task) { build(:task) }
    let(:params) { { name: task.name, state: task.state, project_id: project.id, assignee_ids: [account.id] } }

    it 'OK' do
      expect(result).to have_key(:task)
      expect(result[:task]).to be_a Task
    end
  end
end
