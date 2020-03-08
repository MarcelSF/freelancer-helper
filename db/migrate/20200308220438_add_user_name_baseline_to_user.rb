class AddUserNameBaselineToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :base_line, :integer
  end
end
