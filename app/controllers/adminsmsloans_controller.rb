class AdminsmsloansController < ApplicationController
  before_action :set_smsloan, only: [:show, :edit, :update, :destroy]
  caches_page :smslan
  caches_action :smslan
  respond_to :html, :js
  # before_action :authenticate_admin!
  # GET /smsloans
  # GET /smsloans.json
  def index
    @smsloans = Smsloan.all
  end

  def smslan
    p(params)
    puts "======="
    puts "DA SCHTUFF1111111"
    @smslan = Smsloan.all
    # can use pluck to get specific columns. Though i need to know how to pass a js variable as a ruby variable
    # or use the sliders in form to produce the variable which is the columnname. Th columnname will replace :id, ;name.
    # After I have selected the correct columns
    # @smsloans = Smsloan.pluck(:id, :name)
    

    @extra_title = "Things"

    # THESE THREE LINES WORK TO GET TWO VARIABLES FROM DATABASE
    @plucker = Smsloan.all
  
    if params[:search]
      @smslan = Smsloan.search(params[:search]).order("created_at DESC")
      @pluckervalue = params[:search]
      @stringer = @pluckervalue.join("")
      @replacesmstime = @stringer.sub! "1", "newdebtor_loantime_14d"
      @showresults = @replacesmstime.sub! "2", "_2k"
      @plucker = Smsloan.pluck(@showresults)

      #@showresults = @replacesms["1"]= "14d"

      #@pluckervalue2 = @pluckervalue["1"]= "14"



      #@plucker = Smsloan.pluck(params[:search])
      #@slider 1 value e.g. 1 = 14d                   @slider1 = params[:search] add
      #if slider1.include? "1"
      #  newstring = stringvariable.gsub(/[*1/, '')
        #@slider1.sub! '1', '14d'
        #@slider1.sub! '2', '21d'
        #@slider1.sub! '3', '30d'
        #@slider1.sub! '4', '45d'
        #@slider1.sub! '5', '60d'
        #@slider1.sub! '6', '90d'
        #@slider1.sub! '7', '1year'

        #@slider2.sub! '1', '1000k'
        #@slider2.sub! '2', '2000k'
        #@slider2.sub! '3', '3000k'
        #@slider2.sub! '4', '4000k'
        #@slider2.sub! '5', '5000k'
        #@slider2.sub! '6', '6000k'
        #@slider2.sub! '7', '7000k'
      #end


      #@slider 1 value e.g. 1 = 14d
      # combine theses two into one string variable   @smslan = @slider1 + @slider2
      # search for that variable
    else
      @smslan = Smsloan.all.order('created_at DESC')
      #@pluckvalue = "debtor_loantime_1year_10k"
      #@pluckvalue2 = "newdebtor_loantime_1year_10k"
      #@plucker = Smsloan.pluck(@pluckvalue)
    end




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
