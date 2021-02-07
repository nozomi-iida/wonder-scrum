# frozen_string_literal: true
account = Account.new({ username: 'Nozomi',
                        email: 'test@test.com',
                        password: 'password',
                        password_confirmation: 'password' })
account.save!
