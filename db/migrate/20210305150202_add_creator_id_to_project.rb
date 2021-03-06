class AddCreatorIdToProject < ActiveRecord::Migration[6.1]
  def change
    add_reference :projects, :creator, type: :uuid, foreign_key: { on_delete: :nullify, to_table: :accounts }
  end
end
