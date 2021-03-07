# frozen_string_literal: true
require 'rails_helper'

Rspec.describe Types::ProjectMembershipType do
  subject { described_class }

  describe 'fields' do
    include_examples 'record_fields_examples'
    it { is_expected.to have_field(:id).that_returns('ID!') }
    it { is_expected.to have_field(:role).that_returns('ProjectMembershipRole!') }
    it { is_expected.to have_field(:state).that_returns('ProjectMembershipState!') }
    it { is_expected.to have_field(:account).that_returns('Account!') }
    it { is_expected.to have_field(:project).that_returns('Project!') }
  end
end
