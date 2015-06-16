class WeblogController < ActionController::Base
  caches_page :show, :new, :smslan,
end
