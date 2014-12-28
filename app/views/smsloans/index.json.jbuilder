json.array!(@smsloans) do |smsloan|
  json.extract! smsloan, :id, :bank, :min_loanamoun, :max_loanamoun, :mobile_friendly_site, :smsloan_payment_note, :smsloan_min_age, :cost_free_loan, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :weblink
  json.url smsloan_url(smsloan, format: :json)
end
