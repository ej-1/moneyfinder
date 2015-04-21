class SmsloansController < ApplicationController
  before_action :set_smsloan, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @smsloans = Smsloan.all
    respond_with(@smsloans)
  end

  def show
    respond_with(@smsloan)
  end

  def new
    @smsloan = Smsloan.new
    respond_with(@smsloan)
  end

  def edit
  end

  def create
    @smsloan = Smsloan.new(smsloan_params)
    @smsloan.save
    respond_with(@smsloan)
  end

  def update
    @smsloan.update(smsloan_params)
    respond_with(@smsloan)
  end

  def destroy
    @smsloan.destroy
    respond_with(@smsloan)
  end

  private
    def set_smsloan
      @smsloan = Smsloan.find(params[:id])
    end

    def smsloan_params
      params.require(:smsloan).permit(:bank, :min_loanamount, :max_loanamount, :mobile_friendly_site, :smsloan_payment_note, :smsloan_min_age, :cost_free_loan, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink, :loantime_14d_1k, :loantime_14d_2k, :loantime_14d_3k, :loantime_14d_4k, :loantime_14d_5k, :loantime_14d_6k, :loantime_14d_7k, :loantime_14d_8k, :loantime_14d_9k, :loantime_14d_10k, :loantime_14d_15k, :loantime_14d_20k, :loantime_14d_25k, :loantime_14d_30k, :loantime_21d_1k, :loantime_21d_2k, :loantime_21d_3k, :loantime_21d_4k, :loantime_21d_5k, :loantime_21d_6k, :loantime_21d_7k, :loantime_21d_8k, :loantime_21d_9k, :loantime_21d_10k, :loantime_21d_15k, :loantime_21d_20k, :loantime_21d_25k, :loantime_21d_30k, :loantime_30d_1k, :loantime_30d_2k, :loantime_30d_3k, :loantime_30d_4k, :loantime_30d_5k, :loantime_30d_6k, :loantime_30d_7k, :loantime_30d_8k, :loantime_30d_9k, :loantime_30d_10k, :loantime_30d_15k, :loantime_30d_20k, :loantime_30d_25k, :loantime_30d_30k, :loantime_45d_1k, :loantime_45d_2k, :loantime_45d_3k, :loantime_45d_4k, :loantime_45d_5k, :loantime_45d_6k, :loantime_45d_7k, :loantime_45d_8k, :loantime_45d_9k, :loantime_45d_10k, :loantime_45d_15k, :loantime_45d_20k, :loantime_45d_25k, :loantime_45d_30k, :loantime_60d_1k, :loantime_60d_2k, :loantime_60d_3k, :loantime_60d_4k, :loantime_60d_5k, :loantime_60d_6k, :loantime_60d_7k, :loantime_60d_8k, :loantime_60d_9k, :loantime_60d_10k, :loantime_60d_15k, :loantime_60d_20k, :loantime_60d_25k, :loantime_60d_30k, :loantime_90d_1k, :loantime_90d_2k, :loantime_90d_3k, :loantime_90d_4k, :loantime_90d_5k, :loantime_90d_6k, :loantime_90d_7k, :loantime_90d_8k, :loantime_90d_9k, :loantime_90d_10k, :loantime_90d_15k, :loantime_90d_20k, :loantime_90d_25k, :loantime_90d_30k, :loantime_1year_1k, :loantime_1year_2k, :loantime_1year_3k, :loantime_1year_4k, :loantime_1year_5k, :loantime_1year_6k, :loantime_1year_7k, :loantime_1year_8k, :loantime_1year_9k, :loantime_1year_10k, :loantime_1year_15k, :loantime_1year_20k, :loantime_1year_25k, :loantime_1year_30k, :loantime_2year_1k, :loantime_2year_2k, :loantime_2year_3k, :loantime_2year_4k, :loantime_2year_5k, :loantime_2year_6k, :loantime_2year_7k, :loantime_2year_8k, :loantime_2year_9k, :loantime_2year_10k, :loantime_2year_15k, :loantime_2year_20k, :loantime_2year_25k, :loantime_2year_30k, :loantime_3year_1k, :loantime_3year_2k, :loantime_3year_3k, :loantime_3year_4k, :loantime_3year_5k, :loantime_3year_6k, :loantime_3year_7k, :loantime_3year_8k, :loantime_3year_9k, :loantime_3year_10k, :loantime_3year_15k, :loantime_3year_20k, :loantime_3year_25k, :loantime_3year_30k, :loantime_4year_1k, :loantime_4year_2k, :loantime_4year_3k, :loantime_4year_4k, :loantime_4year_5k, :loantime_4year_6k, :loantime_4year_7k, :loantime_4year_8k, :loantime_4year_9k, :loantime_4year_10k, :loantime_4year_15k, :loantime_4year_20k, :loantime_4year_25k, :loantime_4year_30k, :loantime_5year_1k, :loantime_5year_2k, :loantime_5year_3k, :loantime_5year_4k, :loantime_5year_5k, :loantime_5year_6k, :loantime_5year_7k, :loantime_5year_8k, :loantime_5year_9k, :loantime_5year_10k, :loantime_5year_15k, :loantime_5year_20k, :loantime_5year_25k, :loantime_5year_30k)
    end
end
