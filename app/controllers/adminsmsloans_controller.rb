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

  #def signup
  #  @signup = Signup.new(params[:email])
  #  @signupers = Signup.all
  #end

  # def register
  #   @signup = Signup.new(params[:email])
  #     if(request.post? and @signup.save)
  #           flash[:notice] = “Account Created Successfully”
  #           redirect_to :controller => ‘yourloginsuccessfullycontrollername’
  #     end
  # end

  def smslan
  # @signup = Signup.new(params[:signup])
  #   if(request.post? and @signup.save)
  #         flash[:notice] = “Account Created Successfully”
  #         redirect_to :controller => ‘yourloginsuccessfullycontrollername’
  #   end

  #  @signupers = Signup.all

    @smslan = Smsloan.all

    # can use pluck to get specific columns. Though i need to know how to pass a js variable as a ruby variable
    # or use the sliders in form to produce the variable which is the columnname. Th columnname will replace :id, ;name.
    # After I have selected the correct columns
    # @smsloans = Smsloan.pluck(:id, :name)

    # THESE THREE LINES WORK TO GET TWO VARIABLES FROM DATABASE
    @plucker = Smsloan.all

    if params[:search]

      @pluckervalue = params[:search]
      h = {'1' => 'debtor_loantime_14d', '2' => 'debtor_loantime_21d', '3' => 'debtor_loantime_30d', '4' => 'debtor_loantime_45d', '5' => 'debtor_loantime_60d', '6' => 'debtor_loantime_90d', '7' => 'debtor_loantime_1year'}
      a = {'1' => '_5h', '2' => '_1k', '3' => '_2k', '4' => '_3k', '5' => '_4k', '6' => '_5k', '7' => '_6k', '8' => '_7k', '9' => '_8k', '10' => '_9k', '11' => '_10k', '12' => '_15k', '13' => '_20k', '14' => '_25k', '15' => '_30k'}
      
      #To get new debtor
      @smsarray = @pluckervalue[0]

      @replace2 = a[@pluckervalue[1]]
      @replace1 = h[@smsarray[0]]

      @joiner =[@replace1, @replace2].join("")

      r = {'1' => 'newdebtor_loantime_14d', '2' => 'newdebtor_loantime_21d', '3' => 'newdebtor_loantime_30d', '4' => 'newdebtor_loantime_45d', '5' => 'newdebtor_loantime_60d', '6' => 'newdebtor_loantime_90d', '7' => 'newdebtor_loantime_1year'}
      @replace3 = r[@smsarray[0]]
      @joiner2 =[@replace3, @replace2].join("")

      @plucker = Smsloan.order(@joiner2, @joiner).pluck(:bank, :min_loanamount, :max_loanamount, @joiner, @joiner2, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)

      params.delete :search #this clears the 

      #@slider 1 value e.g. 1 = 14d
      # combine theses two into one string variable   @smslan = @slider1 + @slider2
      # search for that variable
    else
      #HAD TO COMMENT AWAY THIS ROW TO GET BOTH SLIDERS AND DROPDOWNS TO WORK
      #@plucker = Smsloan.pluck(:bank, :debtor_loantime_14d_1k, :newdebtor_loantime_14d_1k)
    end
      # This solved the issue of make the form submit when dragging the sliders without using the submit button.
      # The issue was that the form reloaded the page instead of loading the partial.
      # http://stackoverflow.com/questions/23703631/rails4-ajax-returning-the-text-inside-my-js-erb-file



                        # //http://stackoverflow.com/questions/11762542/passing-multiple-parameters-in-a-form-tag
    if params[:search1] # this block is for the form with dropdowns in mobile and tablet

      @smsdrop1 = params[:search1]
      @smsdrop2 = params[:search2]
      h = {'1' => 'debtor_loantime_14d', '2' => 'debtor_loantime_21d', '3' => 'debtor_loantime_30d', '4' => 'debtor_loantime_45d', '5' => 'debtor_loantime_60d', '6' => 'debtor_loantime_90d', '7' => 'debtor_loantime_1year'}
      a = {'1' => '_5h', '2' => '_1k', '3' => '_2k', '4' => '_3k', '5' => '_4k', '6' => '_5k', '7' => '_6k', '8' => '_7k', '9' => '_8k', '10' => '_9k', '11' => '_10k', '12' => '_15k', '13' => '_20k', '14' => '_25k', '15' => '_30k'}

      @drop1 = h[@smsdrop1[0]]
      @drop2 = a[@smsdrop2]

      @combiner =[@drop1, @drop2].join("")

      r = {'1' => 'newdebtor_loantime_14d', '2' => 'newdebtor_loantime_21d', '3' => 'newdebtor_loantime_30d', '4' => 'newdebtor_loantime_45d', '5' => 'newdebtor_loantime_60d', '6' => 'newdebtor_loantime_90d', '7' => 'newdebtor_loantime_1year'}
      @drop3 = r[@smsdrop1[0]]
      @combiner2 =[@drop3, @drop2].join("")

      @plucker = Smsloan.order(@combiner2, @combiner).pluck(:bank, :min_loanamount, :max_loanamount, @combiner, @combiner2, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)

      params.delete :search #this clears the 
    else
      #HAD TO COMMENT AWAY THIS ROW TO GET BOTH SLIDERS AND DROPDOWNS TO WORK
      #@plucker = Smsloan.pluck(:bank, :debtor_loantime_14d_1k, :newdebtor_loantime_14d_1k)
    end


    # This explanation solved it http://stackoverflow.com/questions/5099182/how-do-i-render-partial-via-ajax-in-rails3-and-jquery
    respond_to do |format|               
      format.html # smslan.html.erb
      format.js   # smslan.js.erb
    end
  end


  def smslan_nouc
    @smslan = Smsloan.all
    # can use pluck to get specific columns. Though i need to know how to pass a js variable as a ruby variable
    # or use the sliders in form to produce the variable which is the columnname. Th columnname will replace :id, ;name.
    # After I have selected the correct columns
    # @smsloans = Smsloan.pluck(:id, :name)

    # THESE THREE LINES WORK TO GET TWO VARIABLES FROM DATABASE
    @plucker = Smsloan.all

    if params[:search]

      @pluckervalue = params[:search]
      h = {'1' => 'debtor_loantime_14d', '2' => 'debtor_loantime_21d', '3' => 'debtor_loantime_30d', '4' => 'debtor_loantime_45d', '5' => 'debtor_loantime_60d', '6' => 'debtor_loantime_90d', '7' => 'debtor_loantime_1year'}
      a = {'1' => '_5h', '2' => '_1k', '3' => '_2k', '4' => '_3k', '5' => '_4k', '6' => '_5k', '7' => '_6k', '8' => '_7k', '9' => '_8k', '10' => '_9k', '11' => '_10k', '12' => '_15k', '13' => '_20k', '14' => '_25k', '15' => '_30k'}
      
      #To get new debtor
      @smsarray = @pluckervalue[0]

      @replace2 = a[@pluckervalue[1]]
      @replace1 = h[@smsarray[0]]

      @joiner =[@replace1, @replace2].join("")

      r = {'1' => 'newdebtor_loantime_14d', '2' => 'newdebtor_loantime_21d', '3' => 'newdebtor_loantime_30d', '4' => 'newdebtor_loantime_45d', '5' => 'newdebtor_loantime_60d', '6' => 'newdebtor_loantime_90d', '7' => 'newdebtor_loantime_1year'}
      @replace3 = r[@smsarray[0]]
      @joiner2 =[@replace3, @replace2].join("")

      @plucker = Smsloan.order(@joiner2, @joiner).pluck(:bank, :min_loanamount, :max_loanamount, @joiner, @joiner2, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)

      params.delete :search #this clears the 

      #@slider 1 value e.g. 1 = 14d
      # combine theses two into one string variable   @smslan = @slider1 + @slider2
      # search for that variable
    else
      #HAD TO COMMENT AWAY THIS ROW TO GET BOTH SLIDERS AND DROPDOWNS TO WORK
      #@plucker = Smsloan.pluck(:bank, :debtor_loantime_14d_1k, :newdebtor_loantime_14d_1k)
    end
      # This solved the issue of make the form submit when dragging the sliders without using the submit button.
      # The issue was that the form reloaded the page instead of loading the partial.
      # http://stackoverflow.com/questions/23703631/rails4-ajax-returning-the-text-inside-my-js-erb-file

                        # //http://stackoverflow.com/questions/11762542/passing-multiple-parameters-in-a-form-tag
    if params[:search1] # this block is for the form with dropdowns in mobile and tablet

      @smsdrop1 = params[:search1]
      @smsdrop2 = params[:search2]
      h = {'1' => 'debtor_loantime_14d', '2' => 'debtor_loantime_21d', '3' => 'debtor_loantime_30d', '4' => 'debtor_loantime_45d', '5' => 'debtor_loantime_60d', '6' => 'debtor_loantime_90d', '7' => 'debtor_loantime_1year'}
      a = {'1' => '_5h', '2' => '_1k', '3' => '_2k', '4' => '_3k', '5' => '_4k', '6' => '_5k', '7' => '_6k', '8' => '_7k', '9' => '_8k', '10' => '_9k', '11' => '_10k', '12' => '_15k', '13' => '_20k', '14' => '_25k', '15' => '_30k'}

      @drop1 = h[@smsdrop1[0]]
      @drop2 = a[@smsdrop2]

      @combiner =[@drop1, @drop2].join("")

      r = {'1' => 'newdebtor_loantime_14d', '2' => 'newdebtor_loantime_21d', '3' => 'newdebtor_loantime_30d', '4' => 'newdebtor_loantime_45d', '5' => 'newdebtor_loantime_60d', '6' => 'newdebtor_loantime_90d', '7' => 'newdebtor_loantime_1year'}
      @drop3 = r[@smsdrop1[0]]
      @combiner2 =[@drop3, @drop2].join("")

      @plucker = Smsloan.order(@combiner2, @combiner).pluck(:bank, :min_loanamount, :max_loanamount, @combiner, @combiner2, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)

      params.delete :search #this clears the 
    else
      #HAD TO COMMENT AWAY THIS ROW TO GET BOTH SLIDERS AND DROPDOWNS TO WORK
      #@plucker = Smsloan.pluck(:bank, :debtor_loantime_14d_1k, :newdebtor_loantime_14d_1k)
    end


    # This explanation solved it http://stackoverflow.com/questions/5099182/how-do-i-render-partial-via-ajax-in-rails3-and-jquery
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
