json.array!(@gratis_smsloans) do |gratis_smsloan|
  json.extract! gratis_smsloan, :id, :bank, :min_loan_amount, :max_loan_amount, :loan_time, :comment, :comment2, :link_button
  json.url gratis_smsloan_url(gratis_smsloan, format: :json)
end
