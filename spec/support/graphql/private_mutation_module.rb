# frozen_string_literal: true
require 'rails_helper'

RSpec.shared_context 'private_mutation_module' do
  subject(:mutation) { described_class.new(object: nil, context: context, field: nil) }

  let_it_be(:account) { create(:account) }
  let(:context) { { current_account: account } }
end
