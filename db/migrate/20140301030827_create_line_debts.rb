class CreateLineDebts < ActiveRecord::Migration
  def change
    create_table :line_debts do |t|
      t.references :debt, index: true
      t.belongs_to :cart, index: true

      t.timestamps
    end
  end
end
