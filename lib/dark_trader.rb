require 'nokogiri'
require 'open-uri'

#recupere le nom de la crypto ainsi que sa valeur et creer le hash correspondant
def crypto
  page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
  tmp = page.css('/html/body/div[1]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr')
  crypto_name_array = (tmp.map { |tr| { tr.css('td[2]/div/a').text => tr.css('td[5]/a').text } })
  crypto_name_array
end

begin
  pp crypto
rescue StandardError => e
  puts 'You messed up in crypto!'
end