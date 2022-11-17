#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './lib/runner'

if ARGV.empty?
  puts 'Please provide path to webserver.log'
  puts 'Usage: ./parser.rb <<path-to-file>>'
  exit
end

filepath = ARGV[0]
Runner.new.run(filepath)
