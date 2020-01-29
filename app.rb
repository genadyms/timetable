# frozen_string_literal: true

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, 'sqlite3:timetable.db'

class Client < ActiveRecord::Base
end

class Week < ActiveRecord::Base
end

get '/' do
  @clients = Client.all
  erb :index
end
