#!/usr/bin/env ruby
require_relative './lib/runner'

if ARGV.length < 1
    puts "Please provide path to webserver.log"
    exit
end

filepath = ARGV[0]
Runner.new.run(filepath)
