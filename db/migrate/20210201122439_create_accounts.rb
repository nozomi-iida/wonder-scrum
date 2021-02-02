class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps

      t.index :email, unique: true
    end
  end
end
