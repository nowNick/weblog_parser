#!/usr/bin/env ruby
require_relative './lib/runner'

if ARGV.length < 1
    puts "Please provide path to webserver.log"
    puts "Usage: ./parser.rb <<path-to-file>>"
    exit
end

filepath = ARGV[0]
Runner.new.run(filepath)
