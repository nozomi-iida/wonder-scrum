# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'confirm user' do
    it 'is valid' do
      account = create(:account)
      expect { account.valid? }.to eq true
    end
  end
end
