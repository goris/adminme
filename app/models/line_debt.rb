class LineDebt < ActiveRecord::Base
  belongs_to :debt
  belongs_to :cart
end
