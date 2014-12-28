json.array!(@mortgageloans) do |mortgageloan|
  json.extract! mortgageloan, :id, :bank, :fixation_rate_3months, :fixation_rate_1years, :fixation_rate_2years, :fixation_rate_3years, :fixation_rate_5years, :fixation_rate_7years, :fixation_rate_10years, :weblink
  json.url mortgageloan_url(mortgageloan, format: :json)
end
