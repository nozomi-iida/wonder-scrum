# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Account, type: :model do
  it 'is valid' do
    account = Account.new(username: "Nozomi", email: "test@test.com", password: "password")
    expect(account.valid?).to eq true
  end
end
