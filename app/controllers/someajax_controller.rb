class SomeajaxController < ApplicationController
  respond_to :html, :js

  def renderpartialform
    #@array_from_controller = Array.new
    respond_to do |format|               
      format.html # smslan.html.erb
      format.js   # smslan.js.erb
    end
  end

  def thepage
    #@array_from_controller = Array.new
  end
end
