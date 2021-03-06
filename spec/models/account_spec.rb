# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Account, skip: true, type: :model do
  let(:account) do
    described_class.new(username: 'Nozomi',
                        email: 'test@test.com',
                        password: 'password',
                        password_confirmation: 'password')
  end
  it 'is valid' do
    expect(account.valid?).to eq true
  end

  it 'is invalid without username' do
    account.username = ' '
    expect(account.invalid?).to eq true
  end

  it 'is invalid without email' do
    account.email = ' '
    expect(account.invalid?).to eq true
  end

  it 'is invalid when email validation accept valid address' do
    invalid_address = %w[user@example,com user_at_foo.org user.name@example.
                         foo@bar_baz.com foo@bar+baz.com]
    invalid_address.each do |valid_address|
      account.email = valid_address
      expect(account.invalid?).to eq true
    end
  end

  it 'is invalid when email is not unique' do
    duplicable_account = account.dup
    account.save
    expect(duplicable_account.invalid?).to eq true
  end

  it 'is invalid when password is too short' do
    account.password = 'pass'
    expect(account.invalid?).to eq true
  end

  it 'is invalid when password is not present', skip: true do
    account.password = ' '
    expect(account.invalid?).to eq true
  end

  it 'is invalid when password ant password confirmation are different' do
    account.password_confirmation = ' '
    expect(account.invalid?).to eq true
  end
end
