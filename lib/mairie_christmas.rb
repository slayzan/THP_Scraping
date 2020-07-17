# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

# ouvre la page de la mairie pour recuperer ladresse email
def get_email(nom)
    nom_commune = nom['href'].delete_prefix "." 
    page2 = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com#{nom_commune}"))
    email = page2.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

# ouvre la page et recupere le nom de la mairie creer a la fin le hash correspondant
def mairie_christmas
        pages = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
        temp = pages.css('[@class="lientxt"]')
        tab = temp.map { |nom| { nom.text => get_email(nom)} }
        tab
end

# recupere l'adresse email de chaque commune du val d'oise
begin
    pp mairie_christmas
rescue StandardError => e
    puts 'You messed in mairie_christmas'
end