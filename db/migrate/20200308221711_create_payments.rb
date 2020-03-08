class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.integer :tax_discount
      t.integer :value
      t.string :notes
      t.boolean :paid
      t.date :date_of_payment

      t.timestamps
    end
  end
end
