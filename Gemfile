source 'https://rubygems.org'
ruby '2.0.0'

gem 'twitter-bootstrap-rails', '~> 2.2.8'
gem 'haml', '4.0'

gem 'heroku'

gem 'devise'

gem 'bootstrap-sass', '3.2.0.2'

gem 'heroku-deflater'

gem 'rake', '~> 10.4.2'

# Paperclip helps to upload logo images for banks in migrations
#gem "paperclip", "~> 4.2"

# Jquery UI is necessary for nice slider bars https://github.com/joliss/jquery-ui-rails
gem 'jquery-ui-rails'

#Creates an admin page for active record https://github.com/sferik/rails_admin#configuration
gem 'rails_admin', '~> 0.6.5'

#Enables login to admin https://github.com/binarylogic/settingslogic.
#Read this http://dev.mensfeld.pl/2014/03/ruby-on-rails-railsadmin-http-basic-authentication/
#Don't think I need this
gem 'settingslogic'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'

# I got this message in the terminal:  WARN  Could not determine content-length of response body. Set content-length of the response or set Response#chunked = true
# ..so I added this http://stackoverflow.com/questions/9612618/warn-could-not-determine-content-length-of-response-body-set-content-length-of
gem 'thin'

# Added these lines because heroku told me to before uploading the app

gem 'rails_12factor'
gem 'unicorn'

# Added this to try and get the data from my database in development to production so it goes to heroku.
# https://coderwall.com/p/90qymq
gem 'yaml_db'


# Used sqlite3 as the database for Active Record (when trying to deploy to heroku for first time,
# had to change from gem 'sqlite3' to gem 'pg' to work. https://devcenter.heroku.com/articles/sqlite3)
# The terminal did not want to install pg. How to fit it : http://wikimatze.de/installing-postgresql-gem-under-ubuntu-and-mac/
# When rake db.create did not work https://teamtreehouse.com/forum/issues-trying-to-push-to-heroku
group :development, :test do
    gem 'sqlite3'
end



group :production do
  gem 'pg'
  #gem 'therubyracer-heroku', '0.8.1.pre3'
  gem "therubyracer", :require => 'v8'
end

gem 'libv8'





# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

