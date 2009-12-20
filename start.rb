#-*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'json'
require 'curb'
require 'cgi'

set :environment
enable :raise_errors

( Dir::glob("app/models/*.rb") ).each do |model|
  require model
end

( Dir::glob("app/controllers/*.rb") ).each do |controller|
  load controller
end
