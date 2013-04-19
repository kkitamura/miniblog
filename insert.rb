#!/usr/bin/env ruby 
# -*- encoding: utf-8 -*-

require 'mysql2'
require "cgi.rb"
require "./blog.rb"

print "Content-type: text/html\n\n"

cgi = CGI.new
title = cgi["title"]
body = cgi["body"]

print "<html><head></head><body>"
client = Blog.new
message =   client.insert(title,body)

print "#{message}"
print "<br>"
print "<a href =\"index.rb\">戻る</a>"
print "</body></html>"
