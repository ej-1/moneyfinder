class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

# https://github.com/sferik/rails_admin/wiki/Troubleshoot to get rails_admin to work
config.assets.enabled = true
#config.assets.initialize_on_precompile = false
#config.assets.precompile += ['rails_admin/rails_admin.css', 'rails_admin/rails_admin.js']
