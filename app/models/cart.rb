class Cart < ActiveRecord::Base

  has_many :line_debts, dependent: :destroy

  def add_debt(debt_id)
    current_account = line_debts.find_by(debt_id: debt_id)
	if current_account
      current_account.quantity += 1
	else
	  current_account = line_debts.build(debt_id: debt_id)
	end
	current_account
  end

  def total_debt
    line_debts.to_a.sum { |debt| debt.total_debt } 
  end
end
