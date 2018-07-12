require 'rubygems'
require 'nokogiri'
require 'open-uri'


def get_the_email_of_a_townhal_from_its_webpage
    doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/saint-gervais.html"))
    doc.css('section[2] > .container[1] > .table > tbody > tr[4] > td[2]').each do |node|
        puts node.text
    end
end

get_the_email_of_a_townhal_from_its_webpage