
class HelloController < ApplicationController
  def world
    @message = "<p>Hello world!</p>"
  end

=begin 
  Nedan är en kod för hur man gör om en sträng till en länk.
  Länkarna till bankerna sparas som strängar i activerecord.
  Strängarna hämtas, men måste sedan göras om till länkar.
  Det enkla sättet att sätta koden för att kalla på data från active record inom en länk htmlsats funkar inte.
  http://www.sitepoint.com/making-links/
=end

  require 'uri'

  def stringtolink(url)
    def makelink(url)
      puts '<a href="' + url + '">' + url + '</a>'
    end
     
    def isURL(word)
      if word =~ URI::regexp
        makelink(word)
      else
        puts word
      end
    end
     
    def hasURL(note)
      words = note.split
      words.each do |word|
        isURL(word)
      end
    end
    
    hasURL(NOTE)
  end

end


