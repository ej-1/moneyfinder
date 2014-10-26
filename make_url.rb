require 'uri'

=begin 
  Här är en kod för hur man gör om en sträng till en länk.
  Länkarna till bankerna sparas som strängar i activerecord.
  Strängarna hämtas, men måste sedan göras om till länkar.
  Det enkla sättet att sätta koden för att kalla på data från active record inom en länk htmlsats funkar inte.
  http://www.sitepoint.com/making-links/

  Jag tog endast den delen av koden som jag behövde, det vill säga, makelink(url)
=end

 


def makelink(url)
  puts '<a href="' + url + '">' + url + '</a>'
end


#makelink('http://www.swedbank.com/ruby/')
