#!/usr/bin/ruby
# -*- encoding: utf-8 -*-
require 'mysql2'
require './connect.rb'
require 'sinatra'

class Blog < ConnectDb 
  def select_blogs 
    @blog_articles.query("SELECT *  FROM  miniblog_contents ") 
  end 
  

  def insert_blog(title,body_of_letter)
    if title==""  ||  body_of_letter == ""
    else 
      @blog_articles.query("INSERT INTO miniblog_contents(title,body_of_letter) VALUES ('#{title}','#{body_of_letter}')") 
    end 
  end

end 
