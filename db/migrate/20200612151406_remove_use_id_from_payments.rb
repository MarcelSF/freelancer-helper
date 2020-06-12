class RemoveUseIdFromPayments < ActiveRecord::Migration[6.0]
  def change
    remove_index :payments, :user_id
    remove_column :payments, :user_id
  end
end
