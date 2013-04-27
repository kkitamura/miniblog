#!/usr/bin/ruby
# -*- encoding: utf-8 -*-
require 'mysql2'
require File.expand_path(File.dirname(__FILE__) + '/connect.rb') 
require 'sinatra'
require 'active_support/core_ext'

class Blog < ConnectDb 
  def select_blogs 
    @blog_articles.query("SELECT *  FROM  miniblog_contents ") 
  end 
  def insert_blog(title,body_of_letter)
    if  !title.blank? && !body_of_letter.blank?
      @blog_articles.query("INSERT INTO miniblog_contents(title,body_of_letter) VALUES ('#{title}','#{body_of_letter}')")  
    elsif title.blank? || body_of_letter.blank?
      raise 'please_write_title_and_body_message'
    else 
      raise 'something_wrong'
    end
  end
end 
