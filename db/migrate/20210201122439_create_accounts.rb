class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
    create_table :accounts, id: :uuid, comment: 'account' do |t|
      t.string :username, comment: 'username'
      t.string :email, comment: 'email'
      t.string :password_digest, comment: 'Encrypted password'

      t.timestamps

      t.index :email, unique: true
    end
  end
end
