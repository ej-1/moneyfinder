# Template to insert data into heroku.
# Use 'heroku pg:psql' to enter psql prompt, then write the below:
#  SELECT * from rates;
# heroku pg:push mylocaldb HEROKU_POSTGRESQL_VIOLET --app protected-gorge-9596

Rate.create()
INSERT INTO rates VALUES (bank: 'Swedbank', min_rate: 1, max_rate: 2, country: 'Sweden', currency: 'SEK', conditions: 'Inga villkor', withdrawal: 'Obegränsat', deposit_guarantee: 'Ja', web_link: '<a class="btn btn-success btn-small" href="http://www.swedbank.se/">Ansök här</a>');

INSERT INTO rates (id, bank, min_rate, max_rate, country, currency, conditions, withdrawal, deposit_guarantee, web_link) VALUES (1, '4Spar', 5, 10,'Sweden', 'SEK', 'Vissa villkor', 'Begränsat', 'Ja', '<a class="btn btn-success btn-small" href="http://www.4spar.se/">Ansök här</a>');
INSERT INTO rates (id, bank, min_rate, max_rate, country, currency, conditions, withdrawal, deposit_guarantee, web_link) VALUES (2, 'Ikano', 2, 3,'Sweden', 'SEK', 'Vissa villkor', 'Oegränsat', 'Ja', '<a class="btn btn-success btn-small" href="http://www.ikano.se/">Ansök här</a>');
INSERT INTO rates (id, bank, min_rate, max_rate, country, currency, conditions, withdrawal, deposit_guarantee, web_link) VALUES (3, 'Swedbank', 1, 2,'Sweden', 'SEK', 'Inga villkor', 'Obegränsat', 'Ja', '<a class="btn btn-success btn-small" href="http://www.swedbank.se/">Ansök här</a>');
INSERT INTO rates (id, bank, min_rate, max_rate, country, currency, conditions, withdrawal, deposit_guarantee, web_link) VALUES (4, 'Marginalen', 4, 6,'Sweden', 'SEK', 'Inga villkor', 'Obegränsat', 'Ja', '<a class="btn btn-success btn-small" href="http://www.marginalen.se/">Ansök här</a>');
INSERT INTO rates (id, bank, min_rate, max_rate, country, currency, conditions, withdrawal, deposit_guarantee, web_link) VALUES (5, 'Nordea', 1, 1.5,'Sweden', 'SEK', 'Inga villkor', 'Obegränsat', 'Ja', '<a class="btn btn-success btn-small" href="http://www.nordea.se/">Ansök här</a>');
