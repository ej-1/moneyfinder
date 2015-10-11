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

  def laneformedlare
    @loanbrokers = Loanbroker.all
  end

  def smslan
  # @signup = Signup.new(params[:signup])
  #   if(request.post? and @signup.save)
  #         flash[:notice] = “Account Created Successfully”
  #         redirect_to :controller => ‘yourloginsuccessfullycontrollername’
  #   end

  #  @signupers = Signup.all

    # NORWEGIAN
    @banknorwegian = Smsloan.where({ bank: '<a href="https://online.adservicemedia.dk/cgi-bin/click.pl?bid=498336&media_id=15141" target="_blank"><img src="http://impr.adservicemedia.dk/show2.php?bid=498336&media_id=15141"/></a>'})
    @banknorwegian_lowestinterest = 0.0499
    @banknorwegian_smallest_invoice_fee = 19
    @banknorwegian_arrangement_fee = 399
    @banknorwegian_table_comment = "(Tabellen är baserat på 4,99% ränta och inkluderar uppläggningsavgiften + aviavgift 19 kr.)"

    # THORN
    @thorn = Smsloan.where({ bank: '<img src="thorn_image.png" alt="Thorn" style="height:40px">'})
    @thorn_lowestinterest = 0.099
    @thorn_smallest_invoice_fee = 0
    @thorn_arrangement_fee = 495
    @thorn_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr.)"

    # FROGTAIL
    @frogtail = Smsloan.where({ bank: '<img src="frogtail_image.png" alt="Frogtail" style="height:40px">'})
    @frogtail_lowestinterest = 0.099
    @frogtail_smallest_invoice_fee = 15
    @frogtail_arrangement_fee = 350
    @frogtail_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 15 kr.)"

    # LEASY MINILÅN
    @leasy_minilan = Smsloan.where({ bank: '<img src="leasyminilan_image.png" alt="Leasy minilån" style="height:35px">'})
    @leasy_minilan_lowestinterest = 0.099
    @leasy_minilan_smallest_invoice_fee = 0
    @leasy_minilan_arrangement_fee = 495
    @leasy_minilan_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr.)"

    # LEASY
    @leasy_lan = Smsloan.where({ bank: '<img src="leasylan_image.png" alt="Leasy lån" style="height:35px">'})
    @leasy_lan_lowestinterest = 0.099
    @leasy_lan_smallest_invoice_fee = 0
    @leasy_lan_arrangement_fee = 495
    @leasy_lan_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr.)"

    # The querying for SMSloans, but skipped querying the hardcoded ones from the database.
    @smslan = Smsloan.all.where.not(bank: ['<a href="https://online.adservicemedia.dk/cgi-bin/click.pl?bid=498336&media_id=15141" target="_blank"><img src="http://impr.adservicemedia.dk/show2.php?bid=498336&media_id=15141"/></a>','<img src="thorn_image.png" alt="Thorn" style="height:40px">','<img src="frogtail_image.png" alt="Frogtail" style="height:40px">','<img src="leasyminilan_image.png" alt="Leasy minilån" style="height:35px">','<img src="leasylan_image.png" alt="Leasy lån" style="height:35px">']).order(:invoice_fee)


    #Tried to make more efficient code, ut did not work
    #@smslan = Smsloan.all.where.not(bank:, "_.name like frogtail%")
    #@smslan = Smsloan.all.where.not(Smsloan.arel_table[:bank].matches('%frogtail'))

    # can use pluck to get specific columns. Though i need to know how to pass a js variable as a ruby variable
    # or use the sliders in form to produce the variable which is the columnname. Th columnname will replace :id, ;name.
    # After I have selected the correct columns
    # @smsloans = Smsloan.pluck(:id, :name)

    # THESE THREE LINES WORK TO GET TWO VARIABLES FROM DATABASE
    @plucker = Smsloan.all

    if params[:search]

      @pluckervalue = params[:search]
      #h = {'1' => 'debtor_loantime_14d', '2' => 'debtor_loantime_21d', '3' => 'debtor_loantime_30d', '4' => 'debtor_loantime_45d', '5' => 'debtor_loantime_60d', '6' => 'debtor_loantime_90d', '7' => 'debtor_loantime_1year'}
      a = {'1' => '_5h', '2' => '_1k', '3' => '_2k', '4' => '_3k', '5' => '_4k', '6' => '_5k', '7' => '_6k', '8' => '_7k', '9' => '_8k', '10' => '_9k', '11' => '_10k', '12' => '_15k', '13' => '_20k', '14' => '_25k', '15' => '_30k'}
      
      #To get new debtor
      @smsarray = @pluckervalue[0]

      @replace2 = a[@pluckervalue[1]]
      #@replace1 = h[@smsarray[0]]


      i = {'1' => '14 dagar', '2' => '21 dagar', '3' => '30 dagar', '4' => '45 dagar', '5' => '60 dagar', '6' => '90 dagar', '7' => '1 år'}
      @smstime_visible_info_for_user2 = i[@smsarray[0]]
      ii = {'1' => '500 kr', '2' => '1000 kr', '3' => '2000 kr', '4' => '3000 kr', '5' => '4000 kr', '6' => '5000 kr', '7' => '6000 kr', '8' => '7000 kr', '9' => '8000 kr', '10' => '9000 kr', '11' => '10 000 kr', '12' => '15 000 kr', '13' => '20 000 kr', '14' => '25 000 kr', '15' => '30 000 kr'}
      @smsamount_visible_info_for_user2 = ii[@pluckervalue[1]]

      #olddebtor
      @drop14d = 'debtor_loantime_14d'
      @drop21d = 'debtor_loantime_21d'
      @drop30d = 'debtor_loantime_30d'
      @drop60d = 'debtor_loantime_60d'
      @drop90d = 'debtor_loantime_90d'
      @drop1y = 'debtor_loantime_1year'

      @combiner14d =[@drop14d, @replace2].join("")
      @combiner21d =[@drop21d, @replace2].join("")
      @combiner30d =[@drop30d, @replace2].join("")
      @combiner60d =[@drop60d, @replace2].join("")
      @combiner90d =[@drop90d, @replace2].join("")
      @combiner1y =[@drop1y, @replace2].join("")

      #r = {'1' => 'newdebtor_loantime_14d', '2' => 'newdebtor_loantime_21d', '3' => 'newdebtor_loantime_30d', '4' => 'newdebtor_loantime_45d', '5' => 'newdebtor_loantime_60d', '6' => 'newdebtor_loantime_90d', '7' => 'newdebtor_loantime_1year'}
      #@drop3 = r[@smsdrop1[0]]

      #newdebtor
      @drop14dn = 'newdebtor_loantime_14d'
      @drop21dn = 'newdebtor_loantime_21d'
      @drop30dn = 'newdebtor_loantime_30d'
      @drop60dn = 'newdebtor_loantime_60d'
      @drop90dn = 'newdebtor_loantime_90d'
      @drop1yn = 'newdebtor_loantime_1year'

      @combiner14dn =[@drop14dn, @replace2].join("")
      @combiner21dn =[@drop21dn, @replace2].join("")
      @combiner30dn =[@drop30dn, @replace2].join("")
      @combiner60dn =[@drop60dn, @replace2].join("")
      @combiner90dn =[@drop90dn, @replace2].join("")
      @combiner1yn =[@drop1yn, @replace2].join("")


      #@joiner =[@replace1, @replace2].join("")

      #r = {'1' => 'newdebtor_loantime_14d', '2' => 'newdebtor_loantime_21d', '3' => 'newdebtor_loantime_30d', '4' => 'newdebtor_loantime_45d', '5' => 'newdebtor_loantime_60d', '6' => 'newdebtor_loantime_90d', '7' => 'newdebtor_loantime_1year'}
      #@replace3 = r[@smsarray[0]]
      #@joiner2 =[@replace3, @replace2].join("")

      #@plucker = Smsloan.order(@joiner2, @joiner).pluck(:bank, :min_loanamount, :max_loanamount, @joiner, @joiner2, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)
      @plucker14 = Smsloan.order(@combiner14dn, @combiner14d).pluck(:bank, :min_loanamount, :max_loanamount, @combiner14d, @combiner14dn, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)
      @plucker21 = Smsloan.order(@combiner21dn, @combiner21d).pluck(:bank, :min_loanamount, :max_loanamount, @combiner21d, @combiner21dn, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)
      # Local and global variables - or how to get variable to work with desc. https://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/45-more-classes/lessons/110-instance-variables
      #How to get null values to be at the end. http://stackoverflow.com/questions/5520628/rails-sort-nils-to-the-end-of-a-scope
      @plucker30 = Smsloan.order(@combiner30dn, @combiner30d).pluck(:bank, :min_loanamount, :max_loanamount, @combiner30d, @combiner30dn, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)
      @plucker60 = Smsloan.order(@combiner60dn, @combiner60d).pluck(:bank, :min_loanamount, :max_loanamount, @combiner60d, @combiner60dn, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)
      @plucker90 = Smsloan.order(@combiner90dn, @combiner90d).pluck(:bank, :min_loanamount, :max_loanamount, @combiner90d, @combiner90dn, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)
      @plucker1 = Smsloan.order(@combiner1yn, @combiner1y).pluck(:bank, :min_loanamount, :max_loanamount, @combiner1y, @combiner1yn, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)








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
      #XX h = {'1' => 'debtor_loantime_14d', '2' => 'debtor_loantime_21d', '3' => 'debtor_loantime_30d', '4' => 'debtor_loantime_45d', '5' => 'debtor_loantime_60d', '6' => 'debtor_loantime_90d', '7' => 'debtor_loantime_1year'}
      a = {'1' => '_5h', '2' => '_1k', '3' => '_2k', '4' => '_3k', '5' => '_4k', '6' => '_5k', '7' => '_6k', '8' => '_7k', '9' => '_8k', '10' => '_9k', '11' => '_10k', '12' => '_15k', '13' => '_20k', '14' => '_25k', '15' => '_30k'}

      #XX @drop1 = h[@smsdrop1[0]]
      @drop2 = a[@smsdrop2]


      x = {'1' => '14 dagar', '2' => '21 dagar', '3' => '30 dagar', '4' => '45 dagar', '5' => '60 dagar', '6' => '90 dagar', '7' => '1 år'}
      @smstime_visible_info_for_user2 = x[@smsdrop1[0]]
      xx = {'1' => '500 kr', '2' => '1000 kr', '3' => '2000 kr', '4' => '3000 kr', '5' => '4000 kr', '6' => '5000 kr', '7' => '6000 kr', '8' => '7000 kr', '9' => '8000 kr', '10' => '9000 kr', '11' => '10 000 kr', '12' => '15 000 kr', '13' => '20 000 kr', '14' => '25 000 kr', '15' => '30 000 kr'}
      @smsamount_visible_info_for_user2 = xx[@smsdrop2]


      #olddebtor
      #XX @combiner =[@drop1, @drop2].join("")
      @drop14d = 'debtor_loantime_14d'
      @drop21d = 'debtor_loantime_21d'
      @drop30d = 'debtor_loantime_30d'
      @drop60d = 'debtor_loantime_60d'
      @drop90d = 'debtor_loantime_90d'
      @drop1y = 'debtor_loantime_1year'

      @combiner14d =[@drop14d, @drop2].join("")
      @combiner21d =[@drop21d, @drop2].join("")
      @combiner30d =[@drop30d, @drop2].join("")
      @combiner60d =[@drop60d, @drop2].join("")
      @combiner90d =[@drop90d, @drop2].join("")
      @combiner1y =[@drop1y, @drop2].join("")

      r = {'1' => 'newdebtor_loantime_14d', '2' => 'newdebtor_loantime_21d', '3' => 'newdebtor_loantime_30d', '4' => 'newdebtor_loantime_45d', '5' => 'newdebtor_loantime_60d', '6' => 'newdebtor_loantime_90d', '7' => 'newdebtor_loantime_1year'}
      @drop3 = r[@smsdrop1[0]]

      #newdebtor
      #@combiner2 =[@drop3, @drop2].join("")
      @drop14dn = 'newdebtor_loantime_14d'
      @drop21dn = 'newdebtor_loantime_21d'
      @drop30dn = 'newdebtor_loantime_30d'
      @drop60dn = 'newdebtor_loantime_60d'
      @drop90dn = 'newdebtor_loantime_90d'
      @drop1yn = 'newdebtor_loantime_1year'

      @combiner14dn =[@drop14dn, @drop2].join("")
      @combiner21dn =[@drop21dn, @drop2].join("")
      @combiner30dn =[@drop30dn, @drop2].join("")
      @combiner60dn =[@drop60dn, @drop2].join("")
      @combiner90dn =[@drop90dn, @drop2].join("")
      @combiner1yn =[@drop1yn, @drop2].join("")


      @plucker14 = Smsloan.order(@combiner14dn, @combiner14d).pluck(:bank, :min_loanamount, :max_loanamount, @combiner14d, @combiner14dn, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)
      @plucker21 = Smsloan.order(@combiner21dn, @combiner21d).pluck(:bank, :min_loanamount, :max_loanamount, @combiner21d, @combiner21dn, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)
      # Local and global variables - or how to get variable to work with desc. https://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/45-more-classes/lessons/110-instance-variables
      #How to get null values to be at the end. http://stackoverflow.com/questions/5520628/rails-sort-nils-to-the-end-of-a-scope
      @plucker30 = Smsloan.order(@combiner30dn, @combiner30d).pluck(:bank, :min_loanamount, :max_loanamount, @combiner30d, @combiner30dn, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)
      @plucker60 = Smsloan.order(@combiner60dn, @combiner60d).pluck(:bank, :min_loanamount, :max_loanamount, @combiner60d, @combiner60dn, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)
      @plucker90 = Smsloan.order(@combiner90dn, @combiner90d).pluck(:bank, :min_loanamount, :max_loanamount, @combiner90d, @combiner90dn, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)
      @plucker1 = Smsloan.order(@combiner1yn, @combiner1y).pluck(:bank, :min_loanamount, :max_loanamount, @combiner1y, @combiner1yn, :max_amount_new_borrower, :invoice_fee, :application_fee, :mobile_friendly_site, :min_age, :low_credit_score, :cost_free_loan, :cost_free_loan_amount, :new_borrower_5K, :new_borrower_10K, :no_uc, :skef_member, :bankid, :open_on_saturdays, :open_on_sundays, :weblink)



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

  def smslan3 #This function is for the button "Visa lånöversikt igen"
    # NORWEGIAN
    @banknorwegian = Smsloan.where({ bank: '<a href="https://online.adservicemedia.dk/cgi-bin/click.pl?bid=498336&media_id=15141" target="_blank"><img src="http://impr.adservicemedia.dk/show2.php?bid=498336&media_id=15141"/></a>'})
    @banknorwegian_lowestinterest = 0.0499
    @banknorwegian_smallest_invoice_fee = 19
    @banknorwegian_arrangement_fee = 399
    @banknorwegian_table_comment = "(Tabellen är baserat på 4,99% ränta och inkluderar uppläggningsavgiften + aviavgift 19 kr.)"

    # THORN
    @thorn = Smsloan.where({ bank: '<img src="thorn_image.png" alt="Thorn" style="height:40px">'})
    @thorn_lowestinterest = 0.099
    @thorn_smallest_invoice_fee = 0
    @thorn_arrangement_fee = 495
    @thorn_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr.)"

    # FROGTAIL
    @frogtail = Smsloan.where({ bank: '<img src="frogtail_image.png" alt="Frogtail" style="height:40px">'})
    @frogtail_lowestinterest = 0.099
    @frogtail_smallest_invoice_fee = 15
    @frogtail_arrangement_fee = 350
    @frogtail_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 15 kr.)"

    # LEASY MINILÅN
    @leasy_minilan = Smsloan.where({ bank: '<img src="leasyminilan_image.png" alt="Leasy minilån" style="height:35px">'})
    @leasy_minilan_lowestinterest = 0.099
    @leasy_minilan_smallest_invoice_fee = 0
    @leasy_minilan_arrangement_fee = 495
    @leasy_minilan_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr.)"

    # LEASY
    @leasy_lan = Smsloan.where({ bank: '<img src="leasylan_image.png" alt="Leasy lån" style="height:35px">'})
    @leasy_lan_lowestinterest = 0.099
    @leasy_lan_smallest_invoice_fee = 0
    @leasy_lan_arrangement_fee = 495
    @leasy_lan_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr.)"


    @smslan = Smsloan.all.where.not(bank: ['<a href="https://online.adservicemedia.dk/cgi-bin/click.pl?bid=498336&media_id=15141" target="_blank"><img src="http://impr.adservicemedia.dk/show2.php?bid=498336&media_id=15141"/></a>','<img src="thorn_image.png" alt="Thorn" style="height:40px">','<img src="frogtail_image.png" alt="Frogtail" style="height:40px">','<img src="leasyminilan_image.png" alt="Leasy minilån" style="height:35px">','<img src="leasylan_image.png" alt="Leasy lån" style="height:35px">']).order(:invoice_fee)
    respond_to do |format|               
      format.html # smslan.html.erb
      format.js   # smslan.js.erb
    end
  end

  def smslan_nouc
  # @signup = Signup.new(params[:signup])
  #   if(request.post? and @signup.save)
  #         flash[:notice] = “Account Created Successfully”
  #         redirect_to :controller => ‘yourloginsuccessfullycontrollername’
  #   end

  #  @signupers = Signup.all

    # NORWEGIAN
    @banknorwegian = Smsloan.where({ bank: '<a href="https://online.adservicemedia.dk/cgi-bin/click.pl?bid=498336&media_id=15141" target="_blank"><img src="http://impr.adservicemedia.dk/show2.php?bid=498336&media_id=15141"/></a>'})
    @banknorwegian_lowestinterest = 0.0499
    @banknorwegian_smallest_invoice_fee = 19
    @banknorwegian_arrangement_fee = 399
    @banknorwegian_table_comment = "(Tabellen är baserat på 4,99% ränta och inkluderar uppläggningsavgiften + aviavgift 19 kr.)"

    # THORN
    @thorn = Smsloan.where({ bank: '<img src="thorn_image.png" alt="Thorn" style="height:40px">'})
    @thorn_lowestinterest = 0.099
    @thorn_smallest_invoice_fee = 0
    @thorn_arrangement_fee = 495
    @thorn_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr.)"

    # FROGTAIL
    @frogtail = Smsloan.where({ bank: '<img src="frogtail_image.png" alt="Frogtail" style="height:40px">'})
    @frogtail_lowestinterest = 0.099
    @frogtail_smallest_invoice_fee = 15
    @frogtail_arrangement_fee = 350
    @frogtail_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 15 kr.)"

    # LEASY MINILÅN
    @leasy_minilan = Smsloan.where({ bank: '<img src="leasyminilan_image.png" alt="Leasy minilån" style="height:35px">'})
    @leasy_minilan_lowestinterest = 0.099
    @leasy_minilan_smallest_invoice_fee = 0
    @leasy_minilan_arrangement_fee = 495
    @leasy_minilan_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr.)"

    # LEASY
    @leasy_lan = Smsloan.where({ bank: '<img src="leasylan_image.png" alt="Leasy lån" style="height:35px">'})
    @leasy_lan_lowestinterest = 0.099
    @leasy_lan_smallest_invoice_fee = 0
    @leasy_lan_arrangement_fee = 495
    @leasy_lan_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr.)"

    # The querying for SMSloans, but skipped querying the hardcoded ones from the database.
    @smslan = Smsloan.all.where.not(bank: ['<a href="https://online.adservicemedia.dk/cgi-bin/click.pl?bid=498336&media_id=15141" target="_blank"><img src="http://impr.adservicemedia.dk/show2.php?bid=498336&media_id=15141"/></a>','<img src="thorn_image.png" alt="Thorn" style="height:40px">','<img src="frogtail_image.png" alt="Frogtail" style="height:40px">','<img src="leasyminilan_image.png" alt="Leasy minilån" style="height:35px">','<img src="leasylan_image.png" alt="Leasy lån" style="height:35px">']).order(:invoice_fee)

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


      i = {'1' => '14 dagar', '2' => '21 dagar', '3' => '30 dagar', '4' => '45 dagar', '5' => '60 dagar', '6' => '90 dagar', '7' => '1 år'}
      @smstime_visible_info_for_user2 = i[@smsarray[0]]
      ii = {'1' => '500 kr', '2' => '1000 kr', '3' => '2000 kr', '4' => '3000 kr', '5' => '4000 kr', '6' => '5000 kr', '7' => '6000 kr', '8' => '7000 kr', '9' => '8000 kr', '10' => '9000 kr', '11' => '10 000 kr', '12' => '15 000 kr', '13' => '20 000 kr', '14' => '25 000 kr', '15' => '30 000 kr'}
      @smsamount_visible_info_for_user2 = ii[@pluckervalue[1]]

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



      #olddebtor
      @combiner =[@drop1, @drop2].join("")

      r = {'1' => 'newdebtor_loantime_14d', '2' => 'newdebtor_loantime_21d', '3' => 'newdebtor_loantime_30d', '4' => 'newdebtor_loantime_45d', '5' => 'newdebtor_loantime_60d', '6' => 'newdebtor_loantime_90d', '7' => 'newdebtor_loantime_1year'}
      @drop3 = r[@smsdrop1[0]]

      #newdebtor
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
    @gratis = GratisSmsloan.all
    @gratis_smsloan = @gratis.order(:max_loan_amount, :loan_time)
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
