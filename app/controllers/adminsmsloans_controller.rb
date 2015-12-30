class AdminsmsloansController < ApplicationController
  before_action :set_smsloan, only: [:show, :edit, :update, :destroy]
  caches_page :smslan
  caches_action :smslan
  respond_to :html, :js
  before_filter :save_url
  def save_url
    @referrer_url = request.env["HTTP_REFERER"] || 'none'
    @epi = @referrer_url.sub!("http://localhost:3000/", "")
  end



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
    @loanbrokers = Loanbroker.all.order(:comments2)
  end

  def smslan
    loangiver_variables
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
    @banknorwegian_table_comment = "(Tabellen är baserat på 4,99% ränta och inkluderar uppläggningsavgiften + aviavgift 19 kr per månad.)"

    # THORN
    @thorn = Smsloan.where({ bank: '<img src="thorn_image.png" alt="Thorn" style="height:40px">'})
    @thorn_lowestinterest = 0.099
    @thorn_smallest_invoice_fee = 0
    @thorn_arrangement_fee = 495
    @thorn_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr per månad.)"

    # FROGTAIL
    @frogtail = Smsloan.where({ bank: '<img src="frogtail_image.png" alt="Frogtail" style="height:40px">'})
    @frogtail_lowestinterest = 0.099
    @frogtail_smallest_invoice_fee = 15
    @frogtail_arrangement_fee = 350
    @frogtail_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 15 kr per månad.)"

    # LEASY MINILÅN
    @leasy_minilan = Smsloan.where({ bank: '<img src="leasyminilan_image.png" alt="Leasy minilån" style="height:35px">'})
    @leasy_minilan_lowestinterest = 0.099
    @leasy_minilan_smallest_invoice_fee = 0
    @leasy_minilan_arrangement_fee = 495
    @leasy_minilan_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr per månad.)"

    # LEASY
    @leasy_lan = Smsloan.where({ bank: '<img src="leasylan_image.png" alt="Leasy lån" style="height:35px">'})
    @leasy_lan_lowestinterest = 0.099
    @leasy_lan_smallest_invoice_fee = 0
    @leasy_lan_arrangement_fee = 495
    @leasy_lan_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr per månad.)"

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
    @banknorwegian_table_comment = "(Tabellen är baserat på 4,99% ränta och inkluderar uppläggningsavgiften + aviavgift 19 kr per månad.)"

    # THORN
    @thorn = Smsloan.where({ bank: '<img src="thorn_image.png" alt="Thorn" style="height:40px">'})
    @thorn_lowestinterest = 0.099
    @thorn_smallest_invoice_fee = 0
    @thorn_arrangement_fee = 495
    @thorn_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr per månad.)"

    # FROGTAIL
    @frogtail = Smsloan.where({ bank: '<img src="frogtail_image.png" alt="Frogtail" style="height:40px">'})
    @frogtail_lowestinterest = 0.099
    @frogtail_smallest_invoice_fee = 15
    @frogtail_arrangement_fee = 350
    @frogtail_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 15 kr per månad.)"

    # LEASY MINILÅN
    @leasy_minilan = Smsloan.where({ bank: '<img src="leasyminilan_image.png" alt="Leasy minilån" style="height:35px">'})
    @leasy_minilan_lowestinterest = 0.099
    @leasy_minilan_smallest_invoice_fee = 0
    @leasy_minilan_arrangement_fee = 495
    @leasy_minilan_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr per månad.)"

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
    @banknorwegian_table_comment = "(Tabellen är baserat på 4,99% ränta och inkluderar uppläggningsavgiften + aviavgift 19 kr per månad.)"

    # THORN
    @thorn = Smsloan.where({ bank: '<img src="thorn_image.png" alt="Thorn" style="height:40px">'})
    @thorn_lowestinterest = 0.099
    @thorn_smallest_invoice_fee = 0
    @thorn_arrangement_fee = 495
    @thorn_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr per månad.)"

    # FROGTAIL
    @frogtail = Smsloan.where({ bank: '<img src="frogtail_image.png" alt="Frogtail" style="height:40px">'})
    @frogtail_lowestinterest = 0.099
    @frogtail_smallest_invoice_fee = 15
    @frogtail_arrangement_fee = 350
    @frogtail_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 15 kr per månad.)"

    # LEASY MINILÅN
    @leasy_minilan = Smsloan.where({ bank: '<img src="leasyminilan_image.png" alt="Leasy minilån" style="height:35px">'})
    @leasy_minilan_lowestinterest = 0.099
    @leasy_minilan_smallest_invoice_fee = 0
    @leasy_minilan_arrangement_fee = 495
    @leasy_minilan_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr per månad.)"

    # LEASY
    @leasy_lan = Smsloan.where({ bank: '<img src="leasylan_image.png" alt="Leasy lån" style="height:35px">'})
    @leasy_lan_lowestinterest = 0.099
    @leasy_lan_smallest_invoice_fee = 0
    @leasy_lan_arrangement_fee = 495
    @leasy_lan_table_comment = "(Tabellen är baserat på 9,9% ränta och inkluderar uppläggningsavgiften + aviavgift 0 kr per månad.)"

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


  def norwegian
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<a href="https://online.adservicemedia.dk/cgi-bin/click.pl?bid=498336&media_id=15141" target="_blank"><img src="http://impr.adservicemedia.dk/show2.php?bid=498336&media_id=15141"/></a>'})
  end

  def leasylan
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="leasylan_image.png" alt="Leasy lån" style="height:35px">'})
  end

  def leasyminilan
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="leasyminilan_image.png" alt="Leasy minilån" style="height:35px">'})
  end

  def thorn
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="thorn_image.png" alt="Thorn" style="height:40px">'})
  end

  def frogtail
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="frogtail_image.png" alt="Frogtail" style="height:40px">'})
  end

  def klicklan
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img class="img-loangiver" src="klicklan_image.png" alt="Klicklån" style="height:30px">'})
  end

  def onea
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="onea_image.png" alt="Onea" style="height:30px">'})
  end

  def monetti
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="monetti_image.png" alt="Monetti" style="height:20px">'})
  end

  def vivus
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="vivus_image.png" alt="Vivus" style="height:30px">'})
  end

  def ferratum
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="ferratum_image.png" alt="Ferratum" style="height:40px">'})
  end

  def meddelandelan
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="meddelandelan_image.png" alt="Meddelandelån" style="height:45px">'})
  end

  def viaconto
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="viaconto_image.png" style="height:45px">'})
  end

  def snabbfinans
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="snabbfinans_image.png" alt="Snabbfinans" style="height:30px">'})
  end

  def natlan
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="natlan_image.png" alt="Nätlån" style="height:30px">'})
  end

  def expresskredit
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="expresskredit_image.png" alt="Expresskredit" style="height:25px">'})
  end

  def cash2you
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="cash2you_image.png" style="height:45px">'})
  end

  def kundfinans
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="kundfinans_image.png" alt="Kundfinans" style="height:30px">'})
  end

  def savelend
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="savelend_image.png" alt="savelend" style="height:25px">'})
  end

  def daypay
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="daypay_image.png" alt="Daypay" style="height:30px">'})
  end

  def moneygo
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="moneygo_image.png" alt="Moneygo" style="height:22px">'})
  end

  def strandiafinans
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="strandiafinans_image.png" alt="Strandia Finans" style="height:40px">'})
  end

  def kredit365
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="kredit365_image.png" alt="365kredit" style="height:30px">'})
  end

  def nanokredit
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="nanokredit_image.png" style="height:35px">'})
  end

  def everydayplus
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="everydayplus_image.png" alt="Everyday+" style="height:30px">'})
  end

  def easycredit
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="easycredit_image.png" alt="easycredit" style="height:20px">'})
  end

  def nanoflex
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="nanoflex_image.png" alt="Nanoflex" style="height:20px">'})
  end

  def kortlan
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="kortlan_image.png" alt="Kortlån" style="height:30px">'})
  end

  def smspengar
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="smspengar_image.png" alt="Smspengar" style="height:30px">'})
  end

  def euroloan
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="euroloan_image.png" alt="Euroloan" style="height:27px">'})
  end

  def extrakredit
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="extrakredit_image.png" alt="Extrakredit" style="height:34px">'})
  end

  def pengos
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="pengos_image.png" alt="Pengos" style="height:30px">'})
  end

  def kreditkontot
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="kreditkontot_image.png" alt="Kreditkontot" style="height:30px">'})
  end

  def trustbuddy
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="trustbuddy_image.png" alt="Trustbuddy" style="height:40px">'})
  end

  def cashbuddy
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="cashbuddy_image.png" style="height:45px">'})
  end

  def risicum
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="riscium_image.png" alt="Riscium" style="height:30px">'})
  end

  def lanbutiken
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="lanbutiken_image.png" alt="Lånbutiken" style="height:45px">'})
  end

  def sakerfinans
    loangiver_variables
    @plucker = Smsloan.where({ bank: '<img src="sakerfinans_image.png" alt="Säkerfinans" style="height:60px">'})
  end





  def loangiver_variables


    #1 BANK NORWEGIAN
    @krav_title_norwegian = "Krav för lån hos Norwegian"
    @krav_1_norwegian = "- Fyllt 18 år."
    @krav_2_norwegian = "- Har inga betalningsanmärkningar"
    @krav_3_norwegian = "- Folkbokförd i Sverige de senaste 36 månaderna"
    @krav_4_norwegian = "Om dokument ombeds: Inkomstdokument om lönespecifikation och eventuellt kopia på din senaste inkomstdeklaration."
        # 'Om 
    #<a href="https://www.banknorwegian.se/Kundservice/laan/nytt-laan#vad-foumlr-slags-dokument-behoumlver-jag-skicka-in">dokument</a>
    #ombeds: Inkomstdokument om lönespecifikation och eventuellt kopia på din senaste inkomstdeklaration.'
        
    @behandling_title_norwegian = "Behandlingstid för ansökan:"
    @behandling_1_norwegian = "0-2 bankdagar (Omedelbart preliminärt besked)"
    @behandling_2_norwegian = ""
    @behandling_3_norwegian = ""
    @behandling_4_norwegian = ""
    @behandling_5_norwegian = ""
    
    @payment_title_norwegian = "Utbetalning:"
    @payment1_norwegian = "-"
    @payment2_norwegian = ""



    #2 THORN
    @krav_title_thorn = "Krav för lån hos Thorn"
    @krav_1_thorn = "- Fyllt 21 år."
    @krav_2_thorn = "- Har inga betalningsanmärkningar"
    @krav_3_thorn = ""
    @krav_4_thorn = ""
    
    @behandling_title_thorn = "Behandlingstid för ansökan:"
    @behandling_1_thorn = "-"
    @behandling_2_thorn = ""
    @behandling_3_thorn = ""
    @behandling_4_thorn = ""
    @behandling_5_thorn = ""
    
    @payment_title_thorn = "Utbetalning:"
    @payment1_thorn = "-"
    @payment2_thorn = "-"




    #3 L'easy lån
    @krav_title_leasylan = "Krav för lån hos L'easy lån"
    @krav_1_leasylan = "- Fyllt 21 år."
    @krav_2_leasylan = "- Har inga betalningsanmärkningar"
    @krav_3_leasylan = ""
    @krav_4_leasylan = ""
    
    @behandling_title_leasylan = "Behandlingstid för ansökan:"
    @behandling_1_leasylan = "-"
    @behandling_2_leasylan = ""
    @behandling_3_leasylan = ""
    @behandling_4_leasylan = ""
    @behandling_5_leasylan = ""
    
    @payment_title_leasylan = "Utbetalning:"
    @payment1_leasylan = "-"
    @payment2_leasylan = "-"






    #3 L'easy minilån
    @krav_title_leasyminilan = "Krav för lån hos L'easy minilån"
    @krav_1_leasyminilan = "- Fyllt 21 år."
    @krav_2_leasyminilan = "- Har inga betalningsanmärkningar"
    @krav_3_leasyminilan = ""
    @krav_4_leasyminilan = ""
    
    @behandling_title_leasyminilan = "Behandlingstid för ansökan:"
    @behandling_1_leasyminilan = "Du får svar på din ansökan inom 24 timmar inom deras öppettider. "
    @behandling_2_leasyminilan = ""
    @behandling_3_leasyminilan = ""
    @behandling_4_leasyminilan = ""
    @behandling_5_leasyminilan = ""
    
    @payment_title_leasyminilan = "Utbetalning:"
    @payment1_leasyminilan = "Pengar direkt eller senast dagen efter."
    @payment2_leasyminilan = "(När din ansökan godkänts, och du har skrivit under låneavtalet med e-legitimation eller BankID, överförs pengarna till ditt konto."
    @payment3_leasyminilan = " Det sker samma dag, eller senast dagen efter, lånet godkänts.)"






    # Frogtail
    @krav_title_frogtail = "Krav för lån hos Frogtail"
    @krav_1_frogtail = "- Folkbokförd i Sverige"
    @krav_2_frogtail = "- Fyllt 18 år."
    @krav_3_frogtail = "- Har en deklarerad inkomst"
    @krav_4_frogtail = "- Du inte har ett skuldsaldo hos Kronofogden"
    
    @behandling_title_frogtail = "Behandlingstid för ansökan:"
    @behandling_1_frogtail = "Handläggningen dagtid vardagar 09:00-20:00 och helger 12.00-17:00."
    @behandling_2_frogtail = ""
    @behandling_3_frogtail = ""
    @behandling_4_frogtail = ""
    @behandling_5_frogtail = ""
    
    @payment_title_frogtail = "Utbetalning:"
    @payment1_frogtail = "Pengar direkt eller senast nästa bankdag (beroende på när låneansökan godkänns)"
    @payment2_frogtail = "Om din låneansökan godkänts vardag före kl 13:00 görs en överföring direkt till ditt konto kl 15:00-17:00 samma dag."
    @payment3_frogtail = "Om ansökan godkänts efter kl 13.00 så har du pengarna nästkommande bankdag."







    #3 Klicklån
    @krav_title_klicklan = "Krav för lån hos Klicklån"
    @krav_1_klicklan = "- Fyllt 21 år"
    @krav_2_klicklan = "- Har inga betalningsanmärkningar"
    @krav_3_klicklan = ""
    @krav_4_klicklan = ""
    
    @behandling_title_klicklan = "Behandlingstid för ansökan:"
    @behandling_1_klicklan = "Du får svar direkt"
    @behandling_2_klicklan = ""
    @behandling_3_klicklan = ""
    @behandling_4_klicklan = ""
    @behandling_5_klicklan = ""
    
    @payment_title_klicklan = "Utbetalning"
    @payment1_klicklan = "Pengar direkt eller senast dagen efter."
    @payment2_klicklan = "(Pengarna sätts in på ditt konto samma dag som du e-signerar ditt låneavtal, eller senast dagen efter.)"
    @payment3_klicklan = ""


    #3 Onea
    @krav_title_ = "Krav för lån hos Onea"
    @krav_1_onea = "- Minst 20 år"
    @krav_2_onea = "- Svensk medborgare"
    @krav_3_onea = "- Svenskt mobilnummer och svenskt kontonummer"
    @krav_4_onea = ""
    
    @behandling_title_onea = "Behandlingstid för ansökan:"
    @behandling_1_onea = "Inom några minuter kommer du att få ett svar på skärmen."
    @behandling_2_onea = ""
    @behandling_3_onea = ""
    @behandling_4_onea = ""
    @behandling_5_onea = ""
    
    @payment_title_onea = "Utbetalning:"
    @payment1_onea = "Om du har ett konto i Nordea får du pengarna direkt under Oneas öppettider. Om du har ett konto hos annan bank kan detta ta längre tid; i vissa fall upp till nästkommande bankdag."
    @payment2_onea = "-"



    #3 Monetti
    @krav_title_ = "Krav för lån hos Monetti"
    @krav_1_monetti = "- Är över 18 år"
    @krav_2_monetti = "- Har en taxerad inkomst"
    @krav_3_monetti = "- Är folkbokförd i Sverige"
    @krav_4_monetti = ""

    @behandling_title_monetti = "Behandlingstid för ansökan:"
    @behandling_1_monetti = ""
    @behandling_2_monetti = ""
    @behandling_3_monetti = ""
    @behandling_4_monetti = ""
    @behandling_5_monetti = ""
    
    @payment_title_monetti = "Utbetalning:"
    @payment1_monetti = "Helgfria vardagar före klockan 13.00 så överförs pengarna till din bank samma dag mellan 15.00 och 17.00."
    @payment2_monetti = "Helgfri vardag efter klockan 13.00 så överförs pengarna till din bank under nästföljande bankdag."
    @payment3_monetti = "Fredagar efter klockan 13.00 eller under helgen så överförs pengarna till din bank under måndagen."
    @payment4_monetti = "Nordea överför pengarna samma dag om du ansöker före klockan 10.30."
    @payment5_monetti = "Exakt tid för insättning på ditt konto kan variera beroende på vilken bank du har"

    
    #3 Vivus
    @krav_title_vivus = "Krav för lån hos Vivus"
    @krav_1_vivus = "- Minst 18 år gammal"
    @krav_2_vivus = "- Svensk medborgare"
    @krav_3_vivus = "- Svenskt mobilnummer samt svenskt kontonummer"
    @krav_4_vivus = ""
  
    @behandling_title_vivus = "Behandlingstid för ansökan:"
    @behandling_1_vivus = "Inom några minuter kommer du att få ett besked på skärmen. Om du däremot valt att identifiera dig via telefon kommer Vivus kundtjänst att kontakta dig under deras öppettider. "
    @behandling_2_vivus = ""
    @behandling_3_vivus = ""
    @behandling_4_vivus = ""
    @behandling_5_vivus = ""
    
    @payment_title_vivus = "Utbetalning:"
    @payment1_vivus = "Om du har Nordea eller Handelsbanken och ditt lån blir beviljad inom deras öppettider får du pengarna inom 15 minuter."
    @payment2_vivus = "Om du har ett konto hos en annan bank så måste du ansöka och beviljas ett lån helgfri vardag innan 13.00 för att få lånet utbetald samma dag, annars blir det nästkommande bankdag."

  
    #3 Ferratum
    @krav_title_ferratum = "Krav för lån hos Ferratum"
    @krav_1_ferratum = "- Åldersgräns på 21 år"
    @krav_2_ferratum = "- Deklarerad inkomst "
    @krav_3_ferratum = "- Inget skuldsaldo hos kronofogden "
    @krav_4_ferratum = "- Folkbokförd i Sverige "
    
    @behandling_title_ferratum = "Behandlingstid för ansökan:"
    @behandling_1_ferratum = "Du får besked direkt på din låneansökan. Ferratum ger ett svar via ett sms inom 10 minuter under deras kontorstider. Ansökan som kommit in efter deras öppettider handläggs omgående nästföljande arbetsdag."
    @behandling_2_ferratum = ""
    @behandling_3_ferratum = ""
    @behandling_4_ferratum = ""
    @behandling_5_ferratum = ""
    
    @payment_title_ferratum = "Utbetalning:"
    @payment1_ferratum = "Om du ansökt via deras webbplats görs utbetalningen direkt."
    @payment2_ferratum = "Har du konto hos Nordea finns pengarna tillgängliga på ditt konto direkt. Har du konto i annan bank, och utbetalningen sker innan kl. 12:00, har du tillgång till pengarna samma dag kl. 17:00, om betalningen sker en helgfri vardag. Sker utbetalningen efter kl. 12:00 finns de tillgängliga på ditt konto nästkommande helgfria vardag kl.12:00."


    #3 Meddelandelån
    @krav_title_meddelandelan = "Krav för lån hos Meddelandelån"
    @krav_1_meddelandelan = "- Minst 20 år"
    @krav_2_meddelandelan = "- Svenskt mobiltelefonnummer och personnummer"
    @krav_3_meddelandelan = "- Ett svenskt bankkonto"
    @krav_4_meddelandelan = "- Inga betalningsanmärkningar eller skulder hos Kronofogden"
    
    @behandling_title_meddelandelan = "Behandlingstid för ansökan:"
    @behandling_1_meddelandelan = "Ansökan behandlas under Meddelandelåns öppettider"
    @behandling_2_meddelandelan = ""
    @behandling_3_meddelandelan = ""
    @behandling_4_meddelandelan = ""
    @behandling_5_meddelandelan = ""

    @payment_title_meddelandelan = "Utbetalning:"
    @payment1_meddelandelan = "Direkt utbetalning till Nordea och Handelsbanken. Det tar ca 1-2 dagar innan pengarna syns på kontot ifall du använder en annan bank."
    @payment2_meddelandelan = "-"



    #3 Nätlån
    @krav_title_natlan = "Krav för lån hos Nätlån"
    @krav_1_natlan = "- 18 år"
    @krav_2_natlan = "- Folkbokförd adress"
    @krav_3_natlan = ""
    @krav_4_natlan = ""
    
    @behandling_title_natlan = "Behandlingstid för ansökan:"
    @behandling_1_natlan = "Lånehandlingar skickas samtidigt till den adress du är folkbokförd på. När du får dessa skriver du under dem och skickar tillbaka dem till Nätlån. Du kan faxa tillbaka dem eller ‘scanna’ in handlingarna och mejla dem till Nätlån. Så fort vi fått dessa i retur betalar de ut lånet till dig"
    @behandling_2_natlan = ""
    @behandling_3_natlan = ""
    @behandling_4_natlan = ""
    @behandling_5_natlan = ""
    
    @payment_title_natlan = "Utbetalning:"
    @payment1_natlan = "I regel har du pengarna på ditt konto senast följande bankdag."
    @payment2_natlan = "-"



    #3 Snabbfinans
    @krav_title_snabbfinans = "Krav för lån hos Snabbfinans"
    @krav_1_snabbfinans = "- Minst 20 år gammal"
    @krav_2_snabbfinans = "- Folkbokförd i Sverige i tre år."
    @krav_3_snabbfinans = "- Inga betalningsanmärkningar"
    @krav_4_snabbfinans = "- Taxerad inkomst på 150 000 kr före skatt."
    @krav_5_snabbfinans = "- Inte ha några pågående lån hos Snabbfinans"

    @behandling_title_snabbfinans = "Behandlingstid för ansökan:"
    @behandling_1_snabbfinans = "Under vardagar mellan 08-18 får du besked via SMS eller mail inom högst en timme. Ansöker du under helgen får du besked under nästkommande vardag inom en timme."
    @behandling_2_snabbfinans = ""
    @behandling_3_snabbfinans = ""
    @behandling_4_snabbfinans = ""
    @behandling_5_snabbfinans = ""
    
    @payment_title_snabbfinans = "Utbetalning:"
    @payment1_snabbfinans = "Direktutbetalning till SEB."
    @payment2_snabbfinans = "För övriga banker är pengarna på ditt konto samma dag under förutsättningen att din ansökan blir beviljad före 13:30 under vardagar. Om ansökan beviljas efter 13:30 är pengarna dig tillhanda under förmiddagen nästkommande bankdag."



    #3 Expresskredit
    @krav_title_expresskredit = "Krav för lån hos Expresskredit"
    @krav_1_expresskredit = "- Minst 18 år"
    @krav_2_expresskredit = ""
    @krav_3_expresskredit = ""
    @krav_4_expresskredit = ""
    
    @behandling_title_expresskredit = "Behandlingstid för ansökan:"
    @behandling_1_expresskredit = "Om du passerar kraven blir du tillfälligt beviljad av deras system. Efter det granskar deras handläggare din ansökan och återkommer sedan med det slutgiltiga beslutet."
    @behandling_2_expresskredit = ""
    @behandling_3_expresskredit = ""
    @behandling_4_expresskredit = ""
    @behandling_5_expresskredit = ""
    
    @payment_title_expresskredit = "Utbetalning:"
    @payment1_expresskredit = "Om du har blivit slutgiltigt beviljad och har Nordea eller Handelsbanken har du pengarna direkt efter du har blivit beviljad. "
    @payment2_expresskredit = "Om du har någon annan bank och blir beviljad innan 13:00 finns pengarna på kontot på eftermiddagen samma dag. För ansökningar efter 13 eller på en dag som inte är en bankdag finns pengarna på kontot nästkommande bankdag på förmiddagen."



    #3 Cash2you - KLAR
    @krav_title_cash2you = "Krav för lån hos Cash2you"
    @krav_1_cash2you = "- Minst 20 år, eller fyller 20 år innevarande kalenderår."
    @krav_2_cash2you = "- Inkomst av tjänst, näringsverksamet, a-kassa eller pension."
    @krav_3_cash2you = "- Svenskt personnummer och folkbokföringsadress."
    @krav_4_cash2you = "- Du får inte ha skuldsanering, vara försatt i konkurs eller stå under förvaltarskap."
    @krav_5_cash2you = "- Du har inget aktuellt skuldsaldo hos kronofogden (betalningsanmärkning och gamla utmätningsförsök får förekomma)."

    @behandling_title_cash2you = "Behandlingstid för ansökan:"
    @behandling_1_cash2you = "Ansökningar godkänns inom 24 timmar på vardagar."
    @behandling_2_cash2you = ""
    @behandling_3_cash2you = ""
    @behandling_4_cash2you = ""
    @behandling_5_cash2you = ""
    
    @payment_title_cash2you = "Utbetalning:"
    @payment1_cash2you = "Om du signerar ditt avtal online sker utbetalningen så snart ditt konto blivit godkänt för autogiro hos Bankgirocentralen."
    @payment2_cash2you = "Detta tar normalt en till två bankdagar."


    #3 Kundfinans
    @krav_title_kundfinans = "Krav för lån hos Kundfinans"
    @krav_1_kundfinans = "- Fyllt 18 år"
    @krav_2_kundfinans = "- Svensk medborgare och har eget svenskt bankkonto"
    @krav_3_kundfinanskundfinans = "- Taxerad inkomst på minst 100.000 kr"
    @krav_4_kundfinans = "- Inga betalningsanmärkningar, inget skuldsaldo, inte skyddad identitet"
    
    @behandling_title_kundfinans = "Behandlingstid för ansökan:"
    @behandling_1_kundfinans =  "Preliminärt besked lämnas direkt. Sedan granskas din ansökan manuellt och Kundfinans återkommer sedan med slutbeslutet. "
    @behandling_2_kundfinans = ""
    @behandling_3_kundfinans = ""
    @behandling_4_kundfinans = ""
    @behandling_5_kundfinans = ""
    
    @payment_title_kundfinans = "Utbetalning:"
    @payment1_kundfinans = "Om du har ett konto hos Nordea, Handelsbanken eller Danskebank har du pengarna på kontot strax efter du har blivit beviljad."
    @payment2_kundfinans = "Om du har någon annan bank tar det ungefär en bankdag."


    #3 Savelend
    @krav_title_savelend = "Krav för lån hos Savelend"
    @krav_1_savelend = "- Ha en inkomst på 150 000 kr per år och ett underskott av kapital som inte är för stort i relation till din inkomst"
    @krav_2_savelend = "- Du bör inte ha för många betalningsförelägganden, eller stora sådana hos Kronofogden."
    @krav_3_savelend = "- Betalningsanmärkningar går bra, men de bör inte vara allt för färska."
    @krav_4_savelend = ""
    
    @behandling_title_savelend = "Behandlingstid för ansökan:"
    @behandling_1_savelend = ""
    @behandling_2_savelend = ""
    @behandling_3_savelend = ""
    @behandling_4_savelend = ""
    @behandling_5_savelend = ""
    
    @payment_title_savelend = "Utbetalning:"
    @payment1_savelend = "Efter att ett lån är beviljat betalar vi ut pengarna så snabbt som möjligt. Om din ansökan blir beviljad och vi gör utbetalningen före kl 13:00 kommer du i de flesta fallen ha pengarna på kontot samma dag. De finns annars på kontot absolut senast nästkommande vardag."
    @payment2_savelend = ""


    #3 Daypay
    @krav_title_daypay = "Krav för lån hos Daypay"
    @krav_1_daypay = "- Minst 20 år gammal"
    @krav_2_daypay = "- Folkbokförd i Sverige"
    @krav_3_daypay = "- Bör inte ha några betalningsanmärkningar"
    @krav_4_daypay = "Om ny kund görs en identitetskontroll som kan innebära att Daypay ringer upp dig för kompletterande uppgifter."
    
    @behandling_title_daypay = "Behandlingstid för ansökan:"
    @behandling_1_daypay = "Preliminärt besked direkt"
    @behandling_2_daypay = "Ansökan och utbetalning hanteras under öppettider."
    @behandling_3_daypay = ""
    @behandling_4_daypay = ""
    @behandling_5_daypay = ""
    
    @payment_title_daypay = "Utbetalning:"
    @payment1_daypay = "När du ansöker om ett snabblån har du pengarna på ditt bankkonto samma dag om du beviljas lånet före kl. 12:00 på en helgfri vardag. Pengarna utbetalas senast kl 17 samma dag vid helgfri vardag."
    @payment2_daypay = ""


    #3 Moneygo
    @krav_title_moneygo = "Krav för lån hos Moneygo"
    @krav_1_moneygo = "- Minst 18 år gammal"
    @krav_2_moneygo = "- Har en taxerad inkomst"
    @krav_3_moneygo = "- Ingen skuld hos kronofogden"
    @krav_4_moneygo = "- Folkbokförd i Sverige"
    
    @behandling_title_moneygo = "Behandlingstid för ansökan:"
    @behandling_1_moneygo = "Ansöker du online så får du besked direkt, annars ger Moneygo besked så fort de behandlat din ansökan vilket oftast är samma dag som de mottagit den. Ibland kan de behöva komplettera uppgifter för att kunna bevilja din ansökan vilket gör att det kan ta någon extra dag innan du får besked."
    @behandling_2_moneygo = ""
    @behandling_3_moneygo = ""
    @behandling_4_moneygo = ""
    @behandling_5_moneygo = ""
    
    @payment_title_moneygo = "Utbetalning:"
    @payment1_moneygo = "Du får pengarna på ditt konto samma dag som Moneygo mottagit ditt kompletta avtal. Ett komplett avtal kan även innefatta t.ex. kopia på legitimation m.m. Observera också att i vissa undantagsfall kan din bank påverka så att utbetalningen tar längre tid. "
    @payment2_moneygo = "-"


    #3 Strandia finans
    @krav_title_strandiafinans = "Krav för lån hos Strandia finans"
    @krav_1_strandiafinans = "- Taxerad inkomst på minst 100 000 kr de senaste två åren"
    @krav_2_strandiafinans = "- Ett mobilnummer och en e-postadress."
    @krav_3_strandiafinans = "- Inga skulder hos kronofogden"
    @krav_4_strandiafinans = ""
    
    @behandling_title_strandiafinans = "Behandlingstid för ansökan:"
    @behandling_1_strandiafinans = "Lånet godkänns preliminärt och granskas under Strandiafinans öppettider."
    @behandling_2_strandiafinans = ""
    @behandling_3_strandiafinans = ""
    @behandling_4_strandiafinans = ""
    @behandling_5_strandiafinans = ""

    @payment_title_strandiafinans = "Utbetalning:"
    @payment1_strandiafinans = "De betalar ut direkt efter beviljandet under deras öppettider. Om du har Nordea eller handelsbanken kommer pengarna direkt in på kontot, för övriga banker tar det max en bankdag. "
    @payment2_strandiafinans = ""


    #3 Kredit365
    @krav_title_kredit365 = "Krav för lån hos Kredit365"
    @krav_1_kredit365 = "- Minst 18 år"
    @krav_2_kredit365 = ""
    @krav_3_kredit365 = ""
    @krav_4_kredit365 = ""
    
    @behandling_title_kredit365 = "Behandlingstid för ansökan:"
    @behandling_1_kredit365 = "-"
    @behandling_2_kredit365 = ""
    @behandling_3_kredit365 = ""
    @behandling_4_kredit365 = ""
    @behandling_5_kredit365 = ""
    
    @payment_title_kredit365 = "Utbetalning:"
    @payment1_kredit365 = "Utbetalning sker bara under Kredit365s öppettider."
    @payment2_kredit365 = ""


    #3 Nanokredit
    @krav_title_nanokredit = "Krav för lån hos Nanokredit (1000 kr - 10 000 kr)"
    @krav_1_nanokredit = "- Svensk medborgare mellan 20 år – 70 år"
    @krav_2_nanokredit = "- En årsinkomst på minst 50 000 kr före skatt"
    @krav_3_nanokredit = "- Inga betalningsanmärkningar"
    @krav_4_nanokredit = ""
    @krav_title_nanokredit2 = "Krav för lån hos Nanokredit (Årslån 15 000 kr - 10 000 kr)"
    @krav_5_nanokredit = "- Du är mellan 20 - 65 år"
    @krav_6_nanokredit = "- En månadsinkomst på minst 12 500 kr per före skatt"
    @krav_7_nanokredit = "- Anställningsform: Fast anställd, vikariat, visstid, egen företagare eller pensionär"
    @krav_8_nanokredit = "- Inga betalningsanmärkningar"

    @behandling_title_nanokredit = "Behandlingstid för ansökan:"
    @behandling_1_nanokredit = "Du får ett preliminärt besked direkt på skärmen vid smslån ansökan. Sedan blir du normalt kontaktad inom 15 minuter under kundtjänsts öppettider med bekräftelse, via telefon eller sms. "
    @behandling_2_nanokredit = ""
    @behandling_3_nanokredit = ""
    @behandling_4_nanokredit = ""
    @behandling_5_nanokredit = ""
    
    @payment_title_nanokredit = "Utbetalning:"
    @payment1_nanokredit = "Om du har ett konto i Nordea får du pengarna inom 2 timmar under Nanokredits öppettider. Om du har ett konto hos en annan bank har du pengar på ditt konto innan kl. 17.00 samma dag om din ansökan beviljas innan kl. 14.00, vid senare tillfälle nästkommande bankdag. Detta gäller Nanokredits Snabblån smslån på 1000 kr till 10 000 kr."
    @payment2_nanokredit = "Gällande Årslånet så tar det mellan 1-2 bankdagar innan du har pengarna på kontot. "


    #3 Everydayplus
    @krav_title_everydayplus = "Krav för lån hos Everydayplus"
    @krav_1_everydayplus = "- Svenska medborgare, folkbokföringsadress, eget mobiltelefonnummer"
    @krav_2_everydayplus = "- Mellan 20 och 75 år"
    @krav_3_everydayplus = "- personligt/eget bankkonto via Internetbank"
    @krav_4_everydayplus = "- En ordnad ekonomi och inga betalningsanmärkningar"

    @behandling_title_everydayplus = "Behandlingstid för ansökan:"
    @behandling_1_everydayplus = "Ansökningsprocessen tar bara ett par minuter och sedan skickar Everydayplus ett beslut om kredit via SMS till dig. Efter att låneavtalet är tecknat är din kredit fritt tillgänglig för dig"
    @behandling_2_everydayplus = ""
    @behandling_3_everydayplus = ""
    @behandling_4_everydayplus = ""
    @behandling_5_everydayplus = ""
    
    @payment_title_everydayplus = "Utbetalning:"
    @payment1_everydayplus = "Banköverföringsperioden beror på vilken bank du har. Har du Nordea förs pengar vanligtvis över inom en kvart (under öppetider). Har du en annan bank så förs uttag gjorda innan kl. 13.30 på vardagar över senare samma dag innan kl. 18. Gör du uttag efter kl. 13.30 får du pengarna nästkommande bankdag, om du har en annan bank än Nordea."
    @payment2_everydayplus = ""


    #3 Easycredit
    @krav_title_easycredit = "Krav för lån hos Easycredit"
    @krav_1_easycredit = "- Minst 18 år gammal"
    @krav_2_easycredit = ""
    @krav_3_easycredit = ""
    @krav_4_easycredit = ""
    
    @behandling_title_easycredit = "Behandlingstid för ansökan:"
    @behandling_1_easycredit = "Omedelbart preliminärt besked."
    @behandling_2_easycredit = "Deras handläggare bara ska gransla ärendet innan det beviljas eller kompletteras med något innan det beviljas. "
    @behandling_3_easycredit = ""
    @behandling_4_easycredit = ""
    @behandling_5_easycredit = ""
    
    @payment_title_easycredit = "Utbetalning:"
    @payment1_easycredit = "Redan så tidigt som kl. 15.00 kan du få in pengarna på kontot. Blir din ansökan beviljad under helgdag eller efter kl. 13.30 på en helgfri vardag har du pengarna på kontot nästkommande vardag på förmiddagen senast kl. 13.00."
    @payment2_easycredit = "Har du konto hos Handelsbanken och ansöker om ett smslån på en vardag måste din ansökan bli beviljad före kl. 13.30 för att du ska få in pengarna på kontot samma dag. Blir din ansökan beviljad före kl. 13.30 har du alltid pengarna på kontot senast kl. 18.00, men det brukar oftast gå mycket fortare än så. Är du kontoinnehavare hos SEB och blir beviljad före kl. 13.30 på en vardag har du pengarna på kontot samma dag. Exakt tid för när pengarna kommer in på kontot är svårt att säga då det beror på hur snabb banken är, men senast kl. 18.00 har du alltid pengarna på kontot. Det är inte ovanligt att pengarna kommer in tidigare och redan vid kl. 15.00 brukar du kunna se pengarna på ditt konto. Blir din ansökan beviljad efter kl. 13.30 eller på en helgdag finns pengarna på kontot nästkommande vardag på förmiddagen, senast kl. 13.00. Om du har konto hos Swedbank eller Nordea har du pengarna senast 1 timme efter du beviljad lån. Gäller under Easycredits öppettider"

    #3 Nanoflex
    @krav_title_nanoflex = "Krav för lån hos Nanoflex"
    @krav_1_nanoflex = "- 20 år gammal"
    @krav_2_nanoflex = "- Varit folkbokförd i Sverige sedan minst 2 år tillbaka"
    @krav_3_nanoflex = "- Inga betalningsanmärkningar"
    @krav_4_nanoflex = "- Sammanräknad deklarerad årsinkomst på minst 50 000 kr"

    @behandling_title_nanoflex = "Behandlingstid för ansökan:"
    @behandling_1_nanoflex = "Besked direkt"
    @behandling_2_nanoflex = ""
    @behandling_3_nanoflex = ""
    @behandling_4_nanoflex = ""
    @behandling_5_nanoflex = ""
    
    @payment_title_nanoflex = "Utbetalning:"
    @payment1_nanoflex = "Pengarna finns tillgängliga på kontot innan kl 17.00 samma dag om ansökan beviljats och godkänts innan kl 14.00. Vid senare ansökan kommer pengarna till kontot senast kl 17.00 vardagen efter."
    @payment2_nanoflex = ""


    #3 Kortlån
    @krav_title_kortlan = "Krav för lån hos Kortlån"
    @krav_1_kortlan = ""
    @krav_2_kortlan = ""
    @krav_3_kortlan = ""
    @krav_4_kortlan = ""
    
    @behandling_title_kortlan = "Behandlingstid för ansökan:"
    @behandling_1_kortlan = "Besked direkt"
    @behandling_2_kortlan = ""
    @behandling_3_kortlan = ""
    @behandling_4_kortlan = ""
    @behandling_5_kortlan = ""
    
    @payment_title_kortlan = "Utbetalning:"
    @payment1_kortlan = "-"
    @payment2_kortlan = ""


    #3 Smspengar
    @krav_title_smspengar = "Krav för lån hos Smspengar"
    @krav_1_smspengar = "- Ej något skuldsaldo eller ett aktivt betalningsföreläggande hos kronofogden. Svenskt bankkonto tillhörande dig, en giltig e-postadress, bokförd i Sverige i minst två år och ej skyddad identitet eller adress."
    @krav_2_smspengar = "- För att låna 500 eller 1 000 kr krävs det minst 20 000 kr i deklarerad inkomst. "
    @krav_3_smspengar = "- För att låna 2 000 kr krävs det minst 50 000 kr i deklarerad inkomst."
    @krav_4_smspengar = "- För belopp mellan 3 000 till 6 000 kr är kravet minst 90 000 kr. För att låna 7 000 kr till 20 000 kr är kravet minst 120 000 kr."
     

    @behandling_title_smspengar = "Behandlingstid för ansökan:"
    @behandling_1_smspengar = "Preliminärt besked direkt. Sedan handläggs ansökan manuellt."
    @behandling_2_smspengar = ""
    @behandling_3_smspengar = ""
    @behandling_4_smspengar = ""
    @behandling_5_smspengar = ""
    
    @payment_title_smspengar = "Utbetalning:"
    @payment1_smspengar = "Har du Danske bank, Handelsbanken eller Nordea och du ansöker inom våra öppettider överförs pengarna inom några minuter förutsatt att det ej är något tillfälligt hinder. Har du ett konto hos någon annan bank överförs pengarna enligt bankernas transaktionsrutiner"
    @payment2_smspengar = "Om det ej är något hinder och du får lånet fullständigt beviljat innan 13.00 på en helgfri arbetsdag har du pengarna senast 17.00 samma dag och om du får lånet beviljat efter 13.00 är pengarna på ditt konto senast 9.30 nästa helgfria vardag. Ansöker du om smslån när kundtjänsten inte är öppen överförs pengarna direkt när de öppnar igen."


    #3 Euroloan
    @krav_title_euroloan = "Krav för lån hos Euroloan"
    @krav_1_euroloan = "- Minimiålder 18 år"
    @krav_2_euroloan = "- Du behöver ha ett svenskt personnummer"
    @krav_3_euroloan = "- Du måste klara en kreditprövning"
    @krav_4_euroloan = ""

    @behandling_title_euroloan = "Behandlingstid för ansökan:"
    @behandling_1_euroloan = "Lånebeslutet får du inom några minuter efter din ansökan. Du kan sedan göra ditt första uttag till ditt bankkonto direkt. "
    @behandling_2_euroloan = ""
    @behandling_3_euroloan = ""
    @behandling_4_euroloan = ""
    @behandling_5_euroloan = ""
    
    @payment_title_euroloan = "Utbetalning:"
    @payment1_euroloan = "Euroloan betalar ut pengarna till ditt konto så fort din ansökan beviljats och du har gjort ett uttag. Detta gäller under vardagar fram till kl 15.00. Beroende på överföringen mellan bankerna kan det ta upp till 1-2 bankdagar innan pengarna finns på ditt konto. "
    @payment2_euroloan = ""


    #3 Extrakredit
    @krav_title_extrakredit = "Krav för lån hos Extrakredit"
    @krav_1_extrakredit = "- Över 18 år och svensk medborgare"
    @krav_2_extrakredit = "- Inga betalningsanmärkningar"
    @krav_3_extrakredit = "- Inkomst på minst 120 000 kr/år"
    @krav_4_extrakredit = "- Clearing- och kontonummer samt mobilnummer "

    @behandling_title_extrakredit = "Behandlingstid för ansökan:"
    @behandling_1_extrakredit = ""
    @behandling_2_extrakredit = ""
    @behandling_3_extrakredit = ""
    @behandling_4_extrakredit = ""
    @behandling_5_extrakredit = ""
    
    @payment_title_extrakredit = "Utbetalning:"
    @payment1_extrakredit = "-"
    @payment2_extrakredit = ""


    #3 Pengos
    @krav_title_pengos = "Krav för lån hos Pengos"
    @krav_1_pengos = "- Mellan 18 - 72 år gammal"
    @krav_2_pengos = "- Folkbokförd i Sverige"
    @krav_3_pengos = "- Tidigare lån från Pengos vara återbetalt"
    @krav_4_pengos = ""
    
    @behandling_title_pengos = "Behandlingstid för ansökan:"
    @behandling_1_pengos = "Svar direkt"
    @behandling_2_pengos = ""
    @behandling_3_pengos = ""
    @behandling_4_pengos = ""
    @behandling_5_pengos = ""
    
    @payment_title_pengos = "Utbetalning:"
    @payment1_pengos = "Om du ansöker under kundtjänstens öppettider Mån - Fre 9-20, Lör-Sön: 10-18 görs utbetalningen när lånet är godkänt. "
    @payment2_pengos = "Om du ansöker utanför öppettiderna betalas pengarna ut när kundtjänst öppnar nästföljande dag."


    #3 Kreditkontot
    @krav_title_kreditkontot = "Krav för lån hos Kreditkontot"
    @krav_1_kreditkontot = ""
    @krav_2_kreditkontot = ""
    @krav_3_kreditkontot = ""
    @krav_4_kreditkontot = ""
    
    @behandling_title_kreditkontot = "Behandlingstid för ansökan:"
    @behandling_1_kreditkontot = ""
    @behandling_2_kreditkontot = "Utbetalning:"
    @behandling_3_kreditkontot = ""
    @behandling_4_kreditkontot = ""
    @behandling_5_kreditkontot = ""
    
    @payment_title_kreditkontot = "Utbetalning:"
    @payment1_kreditkontot = "-"
    @payment2_kreditkontot = "-"



    #3 Trustbuddy
    @krav_title_trustbuddy = "Krav för lån hos Trustbuddy"
    @krav_1_trustbuddy = ""
    @krav_2_trustbuddy = ""
    @krav_3_trustbuddy = ""
    @krav_4_trustbuddy = ""
    
    @behandling_title_trustbuddy = "Behandlingstid för ansökan:"
    @behandling_1_trustbuddy = ""
    @behandling_2_trustbuddy = "Utbetalning:"
    @behandling_3_trustbuddy = ""
    @behandling_4_trustbuddy = ""
    @behandling_5_trustbuddy = ""
    
    @payment_title_trustbuddy = "Utbetalning:"
    @payment1_trustbuddy = "-"
    @payment2_trustbuddy = "-"


    #3 Cashbuddy
    @krav_title_cashbuddy = "Krav för lån hos Cashbuddy"
    @krav_1_cashbuddy = "- Fylla 20 år innevarande kalenderår"
    @krav_2_cashbuddy = "- Ett svenskt personnummer och folkbokförd i Sverige"
    @krav_3_cashbuddy = "- Inget aktuellt skuldsaldo hos kronofogden (betalningsanmärkning och gamla utmätningsförsök får finnas). Du får inte ha skuldsanering, vara försatt i konkurs eller stå under förvaltarskap."
    @krav_4_cashbuddy = "- Du har inkomst av tjänst, näringsverksamhet, a-kassa eller pension."
    
    @behandling_title_cashbuddy = "Behandlingstid för ansökan:"
    @behandling_1_cashbuddy = "Du ser direkt på skärmen om ditt lån har blivit beviljat, om du fått avslag eller om Cashbuddy ska pröva din ansökan manuellt."
    @behandling_2_cashbuddy = ""
    @behandling_3_cashbuddy = ""
    @behandling_4_cashbuddy = ""
    @behandling_5_cashbuddy = ""
    
    @payment_title_cashbuddy = "Utbetalning:"
    @payment1_cashbuddy = "Du får dina pengar utbetalda så snart ditt konto blivit godkänt för autogiro hos Bankgirocentralen. Det tar normalt högst två bankdagar. "
    @payment2_cashbuddy = ""


    #3 Risicum
    @krav_title_risicum = "Krav för lån hos Risicum"
    @krav_1_risicum = "- Minst 18 år gammal."
    @krav_2_risicum = "- Varit folkbokförd i Sverige och har en regelbunden inkomst."
    @krav_3_risicum = "- Saknar betalningsanmärkningar hos kronofogden."
    @krav_4_risicum = "- Äger ett registrerat mobiltelefonabonnemang, har ett Nordea personkonto eller E-legitimation."
    
    @behandling_title_risicum = "Behandlingstid för ansökan:"
    @behandling_1_risicum = "Lånebesluten får du inom några minuter efter din ansökan. Låneansökningar behandlas i ankomstordning mån-fre kl 8-16. Under rusningstider kan det dock dröja längre tid att behandla låneansökningarna."
    @behandling_2_risicum = ""
    @behandling_3_risicum = ""
    @behandling_4_risicum = ""
    @behandling_5_risicum = ""
    
    @payment_title_risicum = "Utbetalning:"
    @payment1_risicum = "Enligt bankerna kan Risicum garantera en kontoöverföring i realtid ifall det konto som kreditmottagaren meddelat oss finns hos Nordea eller Handelsbanken."
    @payment2_risicum = "Till andra banker kommer pengarna på kontot samma bankdag ifall låneansökningen godkänts innan kl 13 samma dag. Om låneansökningen godkänts vid ett senare klockslag eller en helgdag, har du pengarna på ditt konto nästa bankdag."


    #3 Lånbutiken
    @krav_title_lanbutiken = "Krav för lån hos Lånbutiken"
    @krav_1_lanbutiken = "- Minst 20 år gammal"
    @krav_2_lanbutiken = "- Vara folkbokförd i Sverige sedan 2 år tillbaka."
    @krav_3_lanbutiken = "- Sakna betalningsanmärkningar hos kronofogden."
    @krav_4_lanbutiken = "- Äger ett registrerat mobiltelefonabonnemang, har ett Nordea personkonto eller E-legitimation för identifiering."
    
    @behandling_title_lanbutiken = "Behandlingstid för ansökan:"
    @behandling_1_lanbutiken = "Låneansökningarna behandlas i ankomstordning måndag till fredag kl 7-21 samt lördagar kl 9-17. "
    @behandling_2_lanbutiken = "Under rusningstid kan det dock dröja längre tid att behandla låneansökningarna."
    @behandling_3_lanbutiken = ""
    @behandling_4_lanbutiken = ""
    @behandling_5_lanbutiken = ""
    
    @payment_title_lanbutiken = "Utbetalning:"
    @payment1_lanbutiken = "Lånbutiken har direktöverföring till Nordea och Handelsbanken. Pengarna överförs till kontot inom en timme från att ansökan är godkänd. "
    @payment2_lanbutiken = "Till övriga banker måste en ansökan komma in före kl.13 för att man skall få pengarna samma bankdag. Om en ansökan kommer in efter kl. 13 kommer pengarna följande bankdag. Kom ihåg att lämna in ansökan före kl 13 på fredagen så att pengarna hinner överföras innan helgen."


    #3 Säkerfinans
    @krav_title_sakerfinans = "Krav för lån hos Säkerfinans"
    @krav_1_sakerfinans = "- 20 år eller äldre"
    @krav_2_sakerfinans = "- Inga betalningsanmärkninga"
    @krav_3_sakerfinans = "- Folkbokförd i Sverige"
    @krav_4_sakerfinans = "- Har ett mobilabonnemang"
    
    @behandling_title_sakerfinans = "Behandlingstid för ansökan:"
    @behandling_1_sakerfinans = "Besked direkt"
    @behandling_2_sakerfinans = ""
    @behandling_3_sakerfinans = ""
    @behandling_4_sakerfinans = ""
    @behandling_5_sakerfinans = ""
    
    @payment_title_sakerfinans = "Utbetalning:"
    @payment1_sakerfinans = ""
    @payment2_sakerfinans = ""

    @krav_title_viaconto = "Krav för lån hos Säkerfinans"
    @krav_1_viaconto = "- Myndig och folkbokförd i Sverige sedan minst 2 år"
    @krav_2_viaconto = "- Ej skyddad identitet, ej satt under förvaltarskap"
    @krav_3_viaconto = "- Eget privatkonto i svensk bank och egen mobiltelefon"
    @krav_4_viaconto = "- Har du lånat hos Viaconto tidigare, kontrollerar de om du har skött dina tidigare lån hos dem."
    
    @behandling_title_viaconto = "Behandlingstid för ansökan:"
    @behandling_1_viaconto = "Svar direkt."
    @behandling_2_viaconto = ""
    @behandling_3_viaconto = ""
    @behandling_4_viaconto = ""
    @behandling_5_viaconto = ""
    
    @payment_title_sakerfinans = "Utbetalning:"
    @payment1_viaconto = "Vardagar: När pengarna har utbetalats från Viaconto sänder de automatiskt SMS och e-postmeddelande med en bekräftelse att ViaConto har betalat ut pengarna. Får du bekräftelse innan kl 13.30 att ditt lån har utbetalats, så får du vanligtvis pengarna samma dag. Hur snabbt du ser pengarna på ditt konto beror på vilken bank du har. Senast kl 18.00 ska pengarna finnas på ditt konto. Får du bekräftelse efter kl 13.30 att ditt lån har utbetalats, så får du pengarna nästa bankdag. Hur snabbt du ser pengarna på ditt konto beror på vilken bank du har. Vanligtvis ser du pengarna redan på förmiddagen. Senast kl 18.00 ska pengarna finnas på ditt konto. Utbetalningar till kunder med bankkonto i Nordea sker löpande under kundtjänstens öppettider. Har du fått bekräftelsen via SMS att pengarna är utbetalade före klockan 20.00, får du pengarna samma dag. "
    @payment2_viaconto = "Lördagar och helgdagar : Nordea konto: Pengarna kommer in på ditt konto samma dag under kundtjänstens öppettider. Konto i andra banker: Pengarna kommer in på ditt konto nästföljande bankdag."
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
