class ChangePaidDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default :payments, :paid, false
    change_column_default :payments, :tax_discount, 0
  end
end
