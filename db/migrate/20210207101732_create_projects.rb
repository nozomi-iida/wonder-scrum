class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects, id: :uuid, comment: 'project' do |t|
      t.string :title, comment: 'project title'

      t.timestamps
    end
  end
end
