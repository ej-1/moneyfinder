class LoansController < ApplicationController
  def lanerantor
    @loans = Loan.all
  end
end

# Be sure to use plural when naming controller. LoansController, not LoanController
# See here how to create Controllers.
# http://www.sitepoint.com/building-your-first-rails-application-views-and-controllers/
