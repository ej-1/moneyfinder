class Smsloan < ActiveRecord::Base

  def self.search(query)
    where("bank like ?", "%#{query}%")
    #where("new_borrower_5K like ?", "%#{query}%") 
  end

end
