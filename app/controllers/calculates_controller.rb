class CalculatesController < ApplicationController
# If enctounter 'Missin template error'. http://guides.rubyonrails.org/v4.0.8/getting_started.html

#  def lanerantor
#    @loans = Loan.all
#  end
  def calculate
    @result = ''
  end
  def calculate
    @result3 = (params[:number].to_i - params[:number2].to_i)*Loan.third.fixation_rate_1year
  end
end

# Be sure to use plural when naming controller. LoansController, not LoanController
# See here how to create Controllers.
# http://www.sitepoint.com/building-your-first-rails-application-views-and-controllers/
