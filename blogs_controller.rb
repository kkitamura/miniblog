#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-  
require 'mysql2'
require "cgi.rb"
require "./blog.rb"


# Send form of new blog

print "Content-type: text/html\n\n"

print <<EOS

<html>
<head>
<meta http-equiv=\"Content-type\" content=\"text/html; charset=euc-jp\">
</head>
<body>
<h1>ミニブログ</h1>
<form action=\"blogs_insert.rb\" method=\"post\">
title<input type=\"text\" name=\"title\" value=\"\">
<br>
body of letter <textarea name=\"body_of_letter\" valuse=\"\">
</textarea>
<br>
<input type=\"submit\" value=\"add\">
</form>
<table border=\"5\" rules=\"all\">
<tr>
  <td>
  id
  </td>
  <td>
  title
  </td>
  <td>
  body of letter
  </td>
</tr>

EOS

#Display blog contents already added

#client = Blog.new
#board_infos = client.select_blogs
#client.select_blogs
client = Blog.new
client.select_blogs.each do |board_infos|
 
print <<EOS
<tr> 
  <td>
  #{board_infos["id"]}
  </td>
  <td>
  #{board_infos["title"]}
  </td>
  <td>
  #{board_infos["body_of_letter"]}
  </td>
</tr> 
EOS
end


print <<EOS
</table>
</body>
</html>
EOS
 
