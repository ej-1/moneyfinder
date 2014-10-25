class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

# Prevent initializing the application before assets are precompiled (required for heroku) 
config.assets.initialize_on_precompile = false 
# Add Rails Admin assets (required) 
config.assets.precompile += ['rails_admin/rails_admin.css', 'rails_admin/rails_admin.js']
