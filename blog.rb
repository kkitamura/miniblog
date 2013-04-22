#!/usr/bin/ruby
# -*- encoding: utf-8 -*-
require "mysql2"
require "./connect.rb"

class Blog < ConnectDb 

  def select_blogs 
   # @board_infos = @client.query("SELECT *  FROM  miniblog_contents ") 
    @blog_articles.query("SELECT *  FROM  miniblog_contents ") 
  end 
  

  def insert_blog(title,body_of_letter)
    if title==""  ||  body_of_letter == ""
      @message = "タイトル、本文を入力してください"
    else 
      @blog_articles.query("INSERT INTO miniblog_contents(title,body_of_letter) VALUES ('#{title}','#{body_of_letter}')") 
      @message = "登録完了"
    end 
  end

end 
