class LoanbrokersController < ApplicationController
  before_action :set_loanbroker, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @loanbrokers = Loanbroker.all
    respond_with(@loanbrokers)
  end

  def show
    respond_with(@loanbroker)
  end

  def new
    @loanbroker = Loanbroker.new
    respond_with(@loanbroker)
  end

  def edit
  end

  def create
    @loanbroker = Loanbroker.new(loanbroker_params)
    @loanbroker.save
    respond_with(@loanbroker)
  end

  def update
    @loanbroker.update(loanbroker_params)
    respond_with(@loanbroker)
  end

  def destroy
    @loanbroker.destroy
    respond_with(@loanbroker)
  end

  private
    def set_loanbroker
      @loanbroker = Loanbroker.find(params[:id])
    end

    def loanbroker_params
      params.require(:loanbroker).permit(:broker, :broker_logo, :min_amount, :max_amount, :effective_interest, :start_fee, :invoice_fee, :FI_reg, :payment_note, :minloan_time, :maxloan_time, :min_age, :yearly_income, :comments, :web_link)
    end
end
