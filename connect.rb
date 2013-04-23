#!/usr/bin/ruby
require "mysql2"
require "yaml"

#this part's role is that to keep connecting DB

class ConnectDb

  def initialize

    yaml = YAML.load_file "database.yml"

  
    @blog_articles = Mysql2::Client.new(:host => "#{yaml["database"]["host"]}", 
                                 :username => "#{yaml["database"]["username"]}",
                                 :password => "#{yaml["database"]["password"]}" , 
                                 :database => "#{yaml["database"]["database"]}")
   
  end


end
