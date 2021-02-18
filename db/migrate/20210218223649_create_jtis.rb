class CreateJtis < ActiveRecord::Migration[6.1]
  def change
    create_table :jtis, id: :uuid, comment: "" do |t|
      t.references :account, type: :uuid, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
