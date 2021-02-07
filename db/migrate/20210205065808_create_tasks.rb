class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks, id: :uuid, comment: 'task' do |t|
      t.string :name, comment: 'task name'
      t.integer :state, default: 0, comment: 'task state'
      t.boolean :closed, comment: 'task closed?'

      t.references :creator, type: :uuid, foreign_key: { on_delete: :cascade, to_table: :accounts }

      t.timestamps
    end
  end
end
