#!/usr/bin/env ruby 
# -*- encoding: utf-8 -*-

require 'mysql2'
require "cgi.rb"
require "./blog.rb"

print "Content-type: text/html\n\n"

cgi = CGI.new
title = cgi["title"]
body_of_letter = cgi["body_of_letter"]

print "<html><head></head><body>"
client = Blog.new
message = client.insert(title,body_of_letter)

print "#{message}"
print "<br>"
print "<a href =\"blogs_controller.rb\">戻る</a>"
print "</body></html>"
