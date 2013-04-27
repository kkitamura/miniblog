# -*- encoding: utf-8 -*-  
require 'rubygems'
require 'sinatra'
require 'haml'
require 'mysql2'
require './blog.rb'

get '/' do
  @blog_contents = Blog.new
  @error_message = params[:error_message]
  haml :index
end

post '/' do
  blog_content = Blog.new
  begin
    redirect blog_content.insert_blog(params[:title],params[:body_of_letter])
  rescue => exception
    redirect_url = "/?error_message=#{exception}" 
  else 
    redirect_url = '/'
  ensure
    redirect redirect_url
  end
end

get '/*' do
  not_found
end

not_found do
  'ページが見つかりません！'
end

__END__

@@index
%html
  %head
    %title mini-blog 
  %body
    %h1 mini blog
    %p 
      #{@error_message}      
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
            No. 
          %td
            id
          %td
            title 
          %td 
            body of letter

        - @blog_contents.select_blogs.each_with_index do |board_infos,i|   
          %tr
            %td
              #{i+1}
            %td
              #{board_infos["id"]} 
            %td
              #{board_infos["title"]} 
            %td 
              #{board_infos["body_of_letter"]} 

