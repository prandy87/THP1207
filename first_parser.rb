require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
page = Nokogiri::HTML(open("http://en.wikipedia.org/"))   
puts page.class   # => Nokogiri::HTML::Document

puts page.css("title")[0].name   # => title, returns "title" because that is the name of the element. has stored it in an array.
puts page.css("title")[0].text   # => My webpage, returns text in the titte, in an array.

puts page.css("title").text   
# => My webpage   returns the text. No array.

# set URL to point to where the page exists
page = Nokogiri::HTML(open("http://ruby.bastardsbook.com/files/hello-webpage.html"))
news_links = page.css("a").select{|link| link['data-category'] == 'news'}
news_links.each{|link| puts link['href']}

puts news_links.class

news_links = page.css("a[data-category=news]")
news_links.each{|link| puts link['href']}

puts news_links.class

n1 = page.css("a").css("a[data-category=news]")
n1.each{|link| puts link.text}

n2 = page.css("p").css("a[data-category=news]").css("strong")

news_links = page.css("div#references a")
news_links.each{|link| puts "#{link.text}\t#{link['href']}"} 
