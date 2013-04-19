#!/usr/bin/ruby
# -*- encoding: utf-8 -*-
require "mysql2"
require "./connect.rb"

class Blog < ConnectDb 

  def select 
    @board_infos = @client.query("SELECT *  FROM  board_contents ") 
  end 
  

  def insert(title,body)
    if title==""  ||  body == ""
      @message = "内容を入力してね"
    else 
      @client.query("INSERT INTO board_contents(title,body) VALUES ('#{title}','#{body}')") 
      @message = "上手く登録できたよ"
    end 

  end

end 
