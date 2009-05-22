# Here goes your database connection and options:
require 'sequel'
require 'logger'


TINYCDR_ENV = ENV["TINYCDR_ENV"] unless ENV["TINYCDR_ENV"].nil?
TINYCDR_ENV = "development" unless Object.const_defined? "TINYCDR_ENV"
TINYCDR_DB = ENV["TINYCDR_DB"] unless ENV["TINYCDR_DB"].nil?
if TINYCDR_ENV == "testing"
  TINYCDR_DB = "sqlite://db/tiny_cdr_test.db" unless Object.const_defined? "TINYCDR_DB"
else 
  TINYCDR_DB = "sqlite://db/tiny_cdr.db" unless Object.const_defined? "TINYCDR_DB"
end

DB = Sequel.connect(TINYCDR_DB, :loggers => Logger.new(File.join(File.dirname(__FILE__),"..","log","#{TINYCDR_ENV}.log")))

# Here go your requires for models:
# require 'model/user'
require File.join(File.dirname(__FILE__), "..", 'lib', 'tiny_cdr')
require File.join(File.dirname(__FILE__), 'call')
