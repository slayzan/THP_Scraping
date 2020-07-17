# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

# ouvre la page de profil du depute pour recupere lemail
def get_email(x)
    lien = x.css('td[1]/a/@href').text
    page = Nokogiri::HTML(URI.open("http://www2.assemblee-nationale.fr#{lien}"))
    email = page.css('.deputes-liste-attributs > dd:nth-child(8) > ul:nth-child(1) > li:nth-child(2) > a:nth-child(1)').text
end

# recupere le prenom
def get_first(x)
    name = x.css('td[1]/a').text.delete_prefix("Mme ").delete_prefix("M. ")
    name.split.first
end

# recupere le nom
def get_last(x)
    name = x.css('td[1]/a').text.delete_prefix("Mme ").delete_prefix("M. ")
    name.split.last
end

# ouvre la page et creer le hash final comprenant l'email le prenom et le nom
def debuty
    pages = Nokogiri::HTML(URI.open('http://www2.assemblee-nationale.fr/deputes/liste/tableau'))
    tmp = pages.css('//table/tbody/tr')
    debutyname = tmp[0..10].map { |x| { "first_name" => get_first(x), "last_name" => get_last(x), "email" => get_email(x) } }
end

# recupere le nom prenom email de chaque depute pour les ranger dans un hash
begin
    pp debuty
rescue => e
    puts 'You messed up in debuty'
end