class BankerController < ApplicationController
  def index
    @debts = Debt.order(:due_date)
  end
end
