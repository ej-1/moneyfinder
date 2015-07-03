class Adminsmsloan < ActiveRecord::Base
  def self.search(query)
    where("bank ?", "%#{query}%")
    #where("new_borrower_5K like ?", "%#{query}%") 
  end
end
