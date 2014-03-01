class Debt < ActiveRecord::Base
  
  has_many :line_debts

  before_destroy :ensure_not_referenced_by_any_line_debt
		
  validates :due_date, :quantity, :term, presence: true

  validates :quantity, numericality: { greater_than_or_equal_to: 0.0 }

  def self.latest
    Debt.order(:updated_at).last
  end

  private 

    def ensure_not_referenced_by_any_line_item
      if line_debts.empty?
	    return true
	  else
	    errors.add(:base, 'Line Debts present')
	    return false
	  end
    end
end
