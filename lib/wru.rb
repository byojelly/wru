#this file acts as the environment
require 'nokogiri'
#scraping tool
require 'pry'
#Pry is a powerful runtime developer console and IRB alternative for Ruby
require 'open-uri' # this dependency is in match.rb in scrape
#used for scraping
#OpenURI
#OpenURI is an easy-to-use wrapper for Net::HTTP, Net::HTTPS and Net::FTP.
#It is possible to open an http, https or ftp URL as though it were a file:

require_relative "wru/version"
#version of software
require_relative './wru/match'
require_relative './wru/cli'
require_relative './wru/scraper'
