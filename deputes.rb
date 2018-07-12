require 'rubygems'
require 'nokogiri'
require 'open-uri'

@arr = Array.new

def get_name
    doc = Nokogiri::HTML(open('https://www.nosdeputes.fr/deputes'))
    nom = doc.css('span').select{|link| link['class'] == "list_nom"}
    nom.each{|link|
    @arr << link.text.lstrip.tr("'\n''\t'", "")
    
}
print @arr

end

get_name

def get_email

end
