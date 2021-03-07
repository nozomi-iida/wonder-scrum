class CreateProjectMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :project_memberships, id: :uuid do |t|
      t.integer :role, default: 0, comment: 'role'
      t.integer :state, default: 0, comment: 'state'
      t.references :project, { type: :uuid, foreign_key: { on_delete: :cascade } }
      t.references :account, { type: :uuid, foreign_key: { on_delete: :cascade } }

      t.timestamps
    end
  end
end
