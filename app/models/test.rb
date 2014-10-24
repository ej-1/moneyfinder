# File I made where I can test different ruby code
require 'active_record'
require_relative 'rate'
#require 'rails_admin'
#require 'jquery-rails-3.1.2'
#require_relative'/home/erik/.rvm/gems/ruby-1.9.3-p545/gems/jquery-rails-3.1.2/lib/jquery/rails.rb'





#def SortRatesNumerically
  
  #highest_savings_rate = [Rate.select("max_rate").each]
  #highest_savings_rate = [@max_rate]
  #highest_savings_rate = Array.new(20) {@rates}
  #print highest_savings_rate.sort
#end

ratetest= @rates.sort_by &:min_rate
#ratetest = Rate.select("min_rate")
print ratetest

#rates = Rate.select("max_rate")
#highest_savings_rate = [rates.select("max_rate").each]
#print highest_savings_rate


# http://myridia.com/dev_posts/view/109 how to convert active recorr to an array

# READ THIS
# http://edgeguides.rubyonrails.org/
# http://code.tutsplus.com/tutorials/active-record-the-rails-database-bridge--net-30489
