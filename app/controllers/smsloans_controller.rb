class SmsloansController < ApplicationController
  def smsloans
    @smsloans = Smsloans.all
  end
end
