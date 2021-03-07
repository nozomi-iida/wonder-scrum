# frozen_string_literal: true
require 'rails_helper'

Rspec.describe Mutations::DeleteTask do
  subject(:mutation) { described_class.new(object: nil, context: context, field: nil) }

  let_it_be(:account) { create(:account) }
  let(:context) { { current_account: account } }

  describe 'have correct argument' do
    subject { described_class }

    it { is_expected.to accept_argument(:task_id).of_type('ID!') }
  end

  describe '#resolve' do
    subject(:result) { mutation.resolve(**params) }
    let(:task) { create(:task) }
    let(:params) { { task_id: task.id } }

    it 'delete project' do
      expect(result).to have_key(:task)
      expect(result[:task]).to be_a Task
      expect(result[:task].destroyed?).to eq true
    end
  end
end
