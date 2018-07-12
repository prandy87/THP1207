require 'rubygems'
require 'nokogiri'
require 'open-uri'

@arr = Array.new

def get_all_the_urls_of_val_doise_townhalls
    doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
    towns = doc.css('p > a')
    
    towns.each{|link| 
        @arr << "http://annuaire-des-mairies.com/#{link['href']}"
        
}
puts @arr
end

get_all_the_urls_of_val_doise_townhalls



