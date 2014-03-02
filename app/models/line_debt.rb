class LineDebt < ActiveRecord::Base
  belongs_to :debt
  belongs_to :cart
  
  def total_debt
    debt.quantity * quantity
  end

end
