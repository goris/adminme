class Debt < ActiveRecord::Base
  validates :date, :quantity, :term, presence: true

  validates :price, numericality: { greater_than_or_equal_to: 0.0 }



end
