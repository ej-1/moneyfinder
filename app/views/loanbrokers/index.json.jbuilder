json.array!(@loanbrokers) do |loanbroker|
  json.extract! loanbroker, :id, :broker, :broker_logo, :min_amount, :max_amount, :effective_interest, :start_fee, :invoice_fee, :FI_reg, :payment_note, :minloan_time, :maxloan_time, :min_age, :yearly_income, :comments, :web_link
  json.url loanbroker_url(loanbroker, format: :json)
end
