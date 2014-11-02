class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  config.assets.initialize_on_precompile = false
  protect_from_forgery with: :exception
end
