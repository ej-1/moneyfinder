# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rate.create(bank: 'Swedbank', min_rate: 1, max_rate: 2, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.swedbank.se/">Ansök här</a>')

Rate.create(bank: '4spar', min_rate: 5, max_rate: 10, country: 'Sweden', currency: 'SEK', conditions: 'Vissa villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.4spar.se/">Ansök här</a>')

Rate.create(bank: 'Ikano', min_rate: 3, max_rate: 5, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>')
