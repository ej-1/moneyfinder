class LoanController < ApplicationController
  def index
    @loans = Loan.all
  end
end
