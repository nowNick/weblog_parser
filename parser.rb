#!/usr/bin/env ruby

if ARGV.length < 1
    puts "Please provide path to webserver.log"
    exit
end

puts "Would parse #{ARGV[0]}"
