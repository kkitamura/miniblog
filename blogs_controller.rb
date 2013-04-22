#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-  
require 'mysql2'
require "cgi.rb"
require "./blog.rb"

print "Content-type: text/html\n\n"


print "<html>"
print "<head>"
print "<meta http-equiv=\"Content-type\" content=\"text/html; charset=euc-jp\">"
print "</head>"
print "<body>"



print "<h1>ミニブログ</h1>"
print "<form action=\"insert.rb\" method=\"post\">"
print "title<input type=\"text\" name=\"title\" value=\"\">"
print "<br>"
print "content <textarea name=\"body_of_letter\" valuse=\"\">"
print "</textarea>"
print "<br>"
print "<input type=\"submit\" value=\"add\">"
print "</form>"


print '<table border=\"5\" rules=\"all\">'
print "<tr>"
print "<td>"
print "id"
print "</td>"
print "<td>"
print "title"
print "</td>"
print "<td>"
print "body of letter"
print "</td>"
print "</tr>"

client = Blog.new
board_infos = client.select

board_infos.each do |board_infos|
 
  print "<tr>"
  
  print "<td>"
  print "#{board_infos["id"]}"
  print "</td>"

  print "<td>"
  print "#{board_infos["title"]}"
  print "</td>"

  print "<td>"
  print "#{board_infos["body_of_letter"]}"
  print "</td>"
  
end


print "</body>"
print "</html>"
 
