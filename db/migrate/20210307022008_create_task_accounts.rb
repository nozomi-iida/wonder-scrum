class CreateTaskAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :task_accounts, id: :uuid, comment: 'Intermediate table between task and account' do |t|
      t.references :task, type: :uuid, foreign_key: { on_delete: :cascade }
      t.references :account, type: :uuid, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
