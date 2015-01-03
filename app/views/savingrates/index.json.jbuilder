json.array!(@savingrates) do |savingrate|
  json.extract! savingrate, :id, :bank, :min_rate, :max_rate, :country, :currency, :conditions, :withdrawal, :account_time_length, :deposit_guarantee, :amount_limit, :weblink
  json.url savingrate_url(savingrate, format: :json)
end
