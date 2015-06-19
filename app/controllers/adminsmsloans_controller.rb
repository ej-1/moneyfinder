class AdminsmsloansController < ApplicationController
  before_action :set_smsloan, only: [:show, :edit, :update, :destroy]
  caches_page :smslan
  caches_action :smslan
  # before_action :authenticate_admin!
  # GET /smsloans
  # GET /smsloans.json
  def index
    @smsloans = Smsloan.all
  end

  def smslan
    @smsloans = Smsloan.all
    # This explanaion solved it http://stackoverflow.com/questions/5099182/how-do-i-render-partial-via-ajax-in-rails3-and-jquery
    respond_to do |format|               
      format.html # smslan.html.erb
      format.js   # smslan.js.erb
    end
  end




  def show_blog
  @rendersmslan = Smsloan.find(params[:id])
  respond_to do |format|
     format.js 
  end
  end


  def gratislan
    @smsloans = Smsloan.all
  end

  # GET /smsloans/1
  # GET /smsloans/1.json
  def show
  end

  # GET /smsloans/new
  def new
    @smsloan = Smsloan.new
  end

  # GET /smsloans/1/edit
  def edit
  end

  # POST /smsloans
  # POST /smsloans.json
  def create
    @smsloan = Smsloan.new(smsloan_params)

    respond_to do |format|
      if @smsloan.save
        format.html { redirect_to @smsloan, notice: 'Smsloan was successfully created.' }
        format.json { render :show, status: :created, location: @smsloan }
      else
        format.html { render :new }
        format.json { render json: @smsloan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /smsloans/1
  # PATCH/PUT /smsloans/1.json
  def update
    respond_to do |format|
      if @smsloan.update(smsloan_params)
        format.html { redirect_to @smsloan, notice: 'Smsloan was successfully updated.' }
        format.json { render :show, status: :ok, location: @smsloan }
      else
        format.html { render :edit }
        format.json { render json: @smsloan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smsloans/1
  # DELETE /smsloans/1.json
  def destroy
    @smsloan.destroy
    respond_to do |format|
      format.html { redirect_to smsloans_url, notice: 'Smsloan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_smsloan
      @smsloan = Smsloan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def smsloan_params
      params.require(:smsloan).permit(:bank, :min_loanamoun, :max_loanamoun, :mobile_friendly_site, :smsloan_payment_note, :smsloan_min_age, :cost_free_loan, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :weblink)
    end
end
