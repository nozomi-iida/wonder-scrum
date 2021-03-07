# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mutations::UpdateTask do
  include_context 'private_mutation_module'

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:task_id).of_type('ID!') }
    it { is_expected.to accept_argument(:name).of_type('String') }
    it { is_expected.to accept_argument(:state).of_type('TaskState') }
    it { is_expected.to accept_argument(:assignee_ids).of_type('[ID!]') }
    it { is_expected.to accept_argument(:closed).of_type('Boolean') }
  end

  describe '#resolve' do
    subject(:result) { mutation.resolve(**params) }
    let(:account) { create(:account) }
    let(:task) { create(:task, :with_assignees) }
    # FIXME: I want to write more smart
    let(:params) do
      { task_id: task.id,
        name: 'updated_task' }
    end

    it 'OK' do
      expect(result).to have_key(:task)
      expect(result[:task]).to be_a Task
      expect(result[:task][:name]).to eq 'updated_task'
    end
  end
end
