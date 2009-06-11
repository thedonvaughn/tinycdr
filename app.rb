# This file contains your application, it requires dependencies and necessary
# parts of the application.
#
# It will be required from either `config.ru` or `start.rb`

require 'rubygems'
require 'ramaze'

module Kernel
  private

  unless respond_to?(:require_relative)
    def require_relative(*args)
      filename = caller[0][/^(.*):/, 1]
      dir = File.expand_path(File.dirname(filename))
      file = ::File.expand_path(::File.join(dir, *args.map{|a| a.to_s}))
      require(file)
    end
  end
end


# Add the directory this file resides in to the load path, so you can run the
# app from any other working directory
require_relative 'lib/tiny_cdr.rb'

# Initialize controllers and models
require_relative 'model/init'
require_relative 'controller/init'
