# frozen_string_literal: true
require 'rails_helper'

RSpec.shared_examples 'basic_implements_examples' do
  it { is_expected.to implement(:Node, :Record) }
end
