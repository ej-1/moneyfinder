class LoansController < ApplicationController
  def lanerantor
    @loans = Loan.all
  end
#  def lankalkylator
#    @loans = Loan.all
#  end
  def lankalkylator
    @result = ''
  end
  def lankalkylator
    # @results s used to calculte how much customers have to pay monthly for their loan
    @result = params[:number].to_i - params[:number2].to_i.to_i
    #*Loan.third.fixation_rate_1year
    @loans = Loan.all
    @realestatevalue = params[:number].to_i + params[:number2].to_i
  end
end

# Be sure to use plural when naming controller. LoansController, not LoanController
# See here how to create Controllers.
# http://www.sitepoint.com/building-your-first-rails-application-views-and-controllers/

