#!/usr/bin/env ruby
require 'open-uri'
require 'nokogiri'
require 'colorize'
require 'readline'
require 'pry'


require_relative '../lib/deal_category'
require_relative '../lib/game_list.rb'
require_relative '../lib/cli.rb'
require_relative '../lib/game_info.rb'

# puts GamerGrid::CLI.new.start 
#  ruby bin/ultra_gamer.rb 