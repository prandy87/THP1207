require 'rubygems'
require 'nokogiri'


#THIS IS FROM http://ruby.bastardsbook.com/chapters/html-parsing/

#Passing the contents of a webpage to the Nokogiri parser is not much different than opening a regular textfile.

#If the webpage is stored as a file on your hard drive, you can pass it in like so:


page = Nokogiri::HTML(open("index.html"))   
puts page.class   # => Nokogiri::HTML::Document


#The Nokogiri::HTML construct takes in the opened file's contents and wraps it in a special Nokogiri data object.

#The open-uri module
#If the webpage is live on a remote site, like http://en.wikipedia.org/, 
#then you'll want to include the open-uri module, which is part of the standard Ruby distribution but must be explicitly required:

require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
page = Nokogiri::HTML(open("http://en.wikipedia.org/"))   
puts page.class   # => Nokogiri::HTML::Document

#What open-uri does for us is encapsulate all the work of making a HTTP request into the open method, 
#making the operation as simple as as opening a file on our own hard drive.


####################

#Using rest-client
#You can also use the RestClient gem as we've done before. All the Nokogiri::HTML constructor needs is raw HTML as a string.
require 'rubygems'
require 'nokogiri'
require 'restclient'

page = Nokogiri::HTML(RestClient.get("http://en.wikipedia.org/"))   
puts page.class   # => Nokogiri::HTML::Document


