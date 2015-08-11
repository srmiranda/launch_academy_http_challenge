require 'pry'
<<-DOC

HTTP Challenge
--------------

* Define the common HTTP verbs
  - GET: Method for retrieving information
  - POST: Method for creating on a resource
  - PUT/PATCH: Put will replace a resource and Patch will replace part of a resource
  - DELETE: Delete will remove a resource entirely

* Use the tool of your choice to draw the HTTP request/response cycle.
  - include a link to your diagram, here
  https://pbs.twimg.com/media/CMJUDEcUAAAkFTt.png

* Use telnet, curl, or ruby code to retrieve the messages at
  launch-academy-chat.herokuapp.com/messages

* Use telnet, curl, or ruby code to create a new message at
  launch-academy-chat.herokuapp.com/messages

  - Kernel::system method in ruby will allow you to execute command-line utilities such as curl.
  - other useful ruby libraries:
    * Net::HTTP
    * Net::Telnet

DOC


require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://launch-academy-chat.herokuapp.com/messages"))
message = page.css('div.pure-u-1-2')

message_array = message.text.lines
info_array = []
message_array.each do |line|
  info_array << line.strip if line.strip.length > 0
end

puts "Current messages:"
puts info_array[1..-1]

def post_message(message)
  system("curl --verbose -d content='#{message}' http://launch-academy-chat.herokuapp.com/messages")
end

# Posting a message
post_message("Not all who wander are lost.")

# Get site body for messages, still good, just too much text
system("curl --verbose http://launch-academy-chat.herokuapp.com/messages")
