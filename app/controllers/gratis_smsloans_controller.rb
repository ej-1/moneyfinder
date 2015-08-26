class GratisSmsloansController < ApplicationController
  before_action :set_gratis_smsloan, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @gratis_smsloans = GratisSmsloan.all
    respond_with(@gratis_smsloans)
  end

  def show
    respond_with(@gratis_smsloan)
  end

  def new
    @gratis_smsloan = GratisSmsloan.new
    respond_with(@gratis_smsloan)
  end

  def edit
  end

  def create
    @gratis_smsloan = GratisSmsloan.new(gratis_smsloan_params)
    @gratis_smsloan.save
    respond_with(@gratis_smsloan)
  end

  def update
    @gratis_smsloan.update(gratis_smsloan_params)
    respond_with(@gratis_smsloan)
  end

  def destroy
    @gratis_smsloan.destroy
    respond_with(@gratis_smsloan)
  end

  private
    def set_gratis_smsloan
      @gratis_smsloan = GratisSmsloan.find(params[:id])
    end

    def gratis_smsloan_params
      params.require(:gratis_smsloan).permit(:bank, :min_loan_amount, :max_loan_amount, :loan_time, :comment, :comment2, :link_button)
    end
end
