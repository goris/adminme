class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.date :due_date
      t.decimal :quantity
      t.string :term
      t.boolean :payed, precision: 8, scale:2

      t.timestamps
    end
  end
end
