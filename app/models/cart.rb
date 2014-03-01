class Cart < ActiveRecord::Base

  has_many :line_debts, dependent: :destroy

end
