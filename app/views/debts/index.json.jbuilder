json.array!(@debts) do |debt|
  json.extract! debt, :id, :due_date, :quantity, :term, :payed
  json.url debt_url(debt, format: :json)
end
