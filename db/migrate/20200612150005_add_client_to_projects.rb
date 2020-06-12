class AddClientToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :client_id, :bigint, null: false
    add_foreign_key :projects, :clients
    add_index :projects, :client_id
  end
end
