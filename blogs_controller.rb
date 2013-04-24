# -*- encoding: utf-8 -*-  
require 'rubygems'
require 'sinatra'
require 'haml'
require 'mysql2'
require './blog.rb'

get '/' do
  @client = Blog.new
  haml :index
end

post '/' do
  "#{params[:title]}"
  blog_content = Blog.new
  blog_content.insert_blog(params[:title],params[:body_of_letter])
  redirect '/'
end

__END__

@@index
%html
  %head
    %title mini-blog 
  %body
    %h1 mini blog
    %form(action="/" method="post")<
      title
      %input(type="text" name="title" value="")
      %br
      %br
        body of letter
      %textarea(name="body_of_letter" value="")
      %br
      %br
      %input(type="submit" value="submit")
      %br
      %br
      %table(border="5" rules="all")<
        %tr
          %td
            id
          %td
            title 
          %td 
            body of letter

        - @client.select_blogs.each do |board_infos|   
          %tr
            %td
              #{board_infos["id"]} 
            %td
              #{board_infos["title"]} 
            %td 
              #{board_infos["body_of_letter"]} 

