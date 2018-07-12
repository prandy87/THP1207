require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_all_emails_VO
    list = {}
    doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    links = doc.css('p > a')
    links.each{|link|
    url = "http://annuaire-des-mairies.com/#{link['href']}"
    link.each {|email|
    page = Nokogiri::HTML(open(url))
    email =  page.css('section[2] > .container[1] > .table > tbody > tr[4] > td[2]').text 
    list.merge!(lien: url, mail: email)
    }
    puts list
}
end 

get_all_emails_VO