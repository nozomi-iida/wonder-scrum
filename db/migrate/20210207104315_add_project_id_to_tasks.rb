class AddProjectIdToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :project, type: :uuid, foreign_key: { on_delete: :cascade }
  end
end
