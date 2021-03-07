# frozen_string_literal: true
require 'rails_helper'

Rspec.describe Types::TaskType do
  subject { described_class }

  describe 'fields' do
    include_examples 'record_fields_examples'
    it { is_expected.to have_field(:id).that_returns('ID!') }
    it { is_expected.to have_field(:name).that_returns('String!') }
    it { is_expected.to have_field(:state).that_returns('TaskState!') }
    it { is_expected.to have_field(:assignees).that_returns('[Account!]') }
    it { is_expected.to have_field(:creator).that_returns('Account!') }
    it { is_expected.to have_field(:project).that_returns('Project!') }
  end
end
