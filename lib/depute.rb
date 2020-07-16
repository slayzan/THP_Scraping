require 'nokogiri'
require 'open-uri'



def depute
    page = Nokogiri::HTML(URI.open('http://www2.assemblee-nationale.fr/deputes/liste/tableau'))
    tmp = page.css('//table/tbody/tr')
    tmp.each do |tr|
        pp hello = tr.css('td[1]/a')['href']
    end
    #depute_name = tmp.map {|tr|   { tr.css('td[1]/a').text.delete_prefix("Mme ").delete_prefix("M. ") => tr.css('td[1]/a')['href']}}
    #depute_name
end

 depute