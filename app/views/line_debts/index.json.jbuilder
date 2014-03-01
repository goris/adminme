json.array!(@line_debts) do |line_debt|
  json.extract! line_debt, :id, :debt_id, :cart_id
  json.url line_debt_url(line_debt, format: :json)
end
