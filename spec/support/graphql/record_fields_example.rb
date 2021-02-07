# frozen_string_literal: true
require 'rails_helper'

RSpec.shared_examples 'record_fields_examples' do
  it { is_expected.to have_field(:createdAt).that_returns('DateTime!') }
  it { is_expected.to have_field(:updatedAt).that_returns('DateTime!') }
end
