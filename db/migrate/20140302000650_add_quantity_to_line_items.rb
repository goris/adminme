class AddQuantityToLineItems < ActiveRecord::Migration
  def change
    add_column :line_debts, :quantity, :integer, default: 1
  end
end
