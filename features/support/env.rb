require 'rest-client'
require 'selenium-webdriver'
require 'time'
require 'base64'
require 'cucumber'
require 'mysql2'
require 'cucumber'
require 'rspec/expectations'

@connection = Mysql2::Client.new(host:     "localhost",
                                 username: "dmitrievas",
                                 password: "art.KS2733",
                                 database: "ipr",
                                 port:     3306)