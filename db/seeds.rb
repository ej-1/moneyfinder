# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Smsloans.create(smsloan_loancompany: 'SMSlånia')


      t.string :smsloan_loancompany
      t.integer :smsloan_min_loanamount
      t.integer :smsloan_max_loanamount
      t.integer :smsloan_mobile_friendly_site
      t.string :smsloan_payment_note
      t.integer :smsloan_min_age
      t.string :smsloan_cost_free_loan
      t.string :smsloan_5K_new_borrower
      t.string :smsloan_10K_new_borrower
      t.string :smsloan_no_UC
      t.string :smsloan_SKEF_member
      t.string :smsloan_BANKID
      t.string :smsloan_open_on_saturdays
      t.string :smsloan_open_on_saturdays
      t.string :smsloan_web_link



Loan.create(bank: 'Ikano Bank', fixation_rate_3months: '0.032', fixation_rate_1year: '0.031', fixation_rate_2years: '0.029', fixation_rate_3years: '0.025', fixation_rate_5years: '0.032', fixation_rate_7years: '0.032', fixation_rate_10years: '0.032', web_link: '<a class="btn btn-success btn-small" href="http://www.ikanobank.se/L%C3%A5na">Ansök här</a>')
Loan.create(bank: '4Spar', fixation_rate_3months: '0.032', fixation_rate_1year: '0.031', fixation_rate_2years: '0.029', fixation_rate_3years: '0.025', fixation_rate_5years: '0.032', fixation_rate_7years: '0.032', fixation_rate_10years: '0.032', web_link: '<a class="btn btn-success btn-small" href="http://www.4spar.se/L%C3%A5na">Ansök här</a>')
Loan.create(bank: 'SBAB', fixation_rate_3months: '0.032', fixation_rate_1year: '0.031', fixation_rate_2years: '0.029', fixation_rate_3years: '0.025', fixation_rate_5years: '0.032', fixation_rate_7years: '0.032', fixation_rate_10years: '0.032', web_link: '<a class="btn btn-success btn-small" href="http://www.SBAB.se/L%C3%A5na">Ansök här</a>')
Loan.create(bank: 'Akelius', fixation_rate_3months: '0.022', fixation_rate_1year: '0.021', fixation_rate_2years: '2.9', fixation_rate_3years: '0.025', fixation_rate_5years: '0.032', fixation_rate_7years: '0.032', fixation_rate_10years: '0.032', web_link: '<a class="btn btn-success btn-small" href="http://www.akelius.se/L%C3%A5na">Ansök här</a>')


Rate.create(bank: '4spar', min_rate: 5, max_rate: 10, country: 'Sweden', currency: 'SEK', conditions: 'Vissa villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.4spar.se/">Ansök här</a>')
Rate.create(bank: 'Akelius', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Ikano Bank', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Avanza Bank', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Swespar', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: '24 Money', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: '24 Spar', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Marginalen', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'BlueStep Finans', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'BIGBANK', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'OK Ekonomisk förening', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'HostSpar', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Solidum', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Collector', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Svea Ekonomi', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'GCC Capital', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Klarna Sparkonto', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'PayEx Spara', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'TF Bank', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Resurs Bank', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Santande Consumer Bank', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Anita Finans', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'AK Spar', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'GE Money Bank', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Remium', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Landshypotek', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Bank Norwegian', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'SevenDay', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Danske Bank', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Avida Finans', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Ńordea', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Volvofinans Bank', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'SBAB', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Lantmännen Finans', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Ancoria Insurance', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Ekobanken', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'KF Sparkassa', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Swedbank', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Forex Bank', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Handelsbanken', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'SkandiaBanken', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'SEB', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Sparbanken Öresund', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Nordnet', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'ICA Banken', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
Rate.create(bank: 'Riksgälden', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
