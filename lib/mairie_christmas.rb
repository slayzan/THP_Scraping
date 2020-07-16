# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'


def get_email(nom)
    nomCommune = nom['href'].delete_prefix "." 
    page2 = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com#{nomCommune}"))
    email = page2.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
end

def mairie_christmas
        pages = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
        temp = pages.css('[@class="lientxt"]')
        tab = temp.map { |nom| { nom.text => get_email(nom)} }
        tab
end

begin
    pp mairie_christmas
rescue StandardError => e
    puts 'You messed in mairie_christmas'
end