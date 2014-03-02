class CombineDebtsInCart < ActiveRecord::Migration
  def change
  end

  def up
    Cart.all.each do |cart|
	  sums = cart.line_debts.group(:debt_id).sum(:quantity)

	  sums.each do |debt_id, quantity|
	    if quantity > 1
		  cart.line_debts.where(debt_id: debt_id).delete_all

		  account = cart.line_debts.build(debt_id: debt_id)
		  account.quantity = quantity
		  account.save!
		end
	  end
	end
  end

  def down
    LineDebt.where("quantity>1").each do |line_debt|
	  line_debt.quantity.times do
	    LineDebt.create cart_id: line_debt.cart_id, debt_id: line_debt.debt_id, quantity: 1
	  end
	  line_debt.destroy
	end
  end

end
