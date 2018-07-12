require 'rubygems'
require 'nokogiri'
require 'open-uri'

@arr = Array.new
@arr2 = Array.new
@tab = Hash.new 

def get_currency
    doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
    cryptos = doc.css('a').select{|link| link['class'] == "currency-name-container link-secondary"}
    cryptos.each{|link|
        @arr << link.text
}
    #puts @arr[0 .. 10]

end

def get_value
    
    doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
    value = doc.css('a').select{|link| link['class'] == "price"}
    value.each{|link|
    @arr2 << link.text
   
}
    #puts @arr2[0 .. 10]
end 

def return_tab
    get_currency
    get_value
    
    @arr.each_with_index {|k, i|@tab[k] = @arr2[i]}
    tab2 = Array.new
    tab2.push(@tab)
    puts tab2
end 

return_tab




